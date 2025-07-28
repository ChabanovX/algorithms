/// There is an ATM machine that stores banknotes of 5 denominations:
/// 20, 50, 100, 200, and 500 dollars. Initially the ATM is empty.
/// The user can use the machine to deposit or withdraw any amount of money.
///
/// When withdrawing, the machine prioritizes using banknotes of larger values.
///
/// For example, if you want to withdraw $300 and there are 2 $50 banknotes,
/// 1 $100 banknote, and 1 $200 banknote, then the machine will use the $100
/// and $200 banknotes.
///
/// However, if you try to withdraw $600 and there are 3 $200 banknotes and
/// 1 $500 banknote, then the withdraw request will be rejected because the
/// machine will first try to use the $500 banknote and then be unable to
/// use banknotes to complete the remaining $100. Note that the machine is
/// not allowed to use the $200 banknotes instead of the $500 banknote.
class ATM {
  ATM() {}

  final Map<String, int> cashMap = {
    "20": 0,
    "50": 0,
    "100": 0,
    "200": 0,
    "500": 0,
  };

  /// atm.deposit([0,0,1,2,1]); # Deposits 1 $100 banknote, 2 $200 banknotes,
  ///                           # and 1 $500 banknote.
  void deposit(List<int> banknotesCount) {
    if (banknotesCount.length != 5) throw Exception('Invalid length');

    for (int i = 0; i < cashMap.length; i++) {
      cashMap[cashMap.keys.elementAt(i)] =
          cashMap[cashMap.keys.elementAt(i)]! + banknotesCount[i];
    }
  }

  /// Returns an array of length 5 of the number of banknotes
  /// that will be handed to the user in the order $20, $50, $100, $200, and $500,
  /// and update the number of banknotes in the ATM after withdrawing.
  ///
  /// Returns [-1] if it is not possible (do not withdraw any banknotes in this case).
  List<int> withdraw(int amount) {
    List<int> reversedBanknotes = [];
    // 500, 200 ...
    final decrCash = cashMap.keys.toList().reversed;

    int amountLeft = amount;
    for (final String cash in decrCash) {
      final int ratio = amountLeft ~/ int.parse(cash);
      if (ratio < 1) {
        reversedBanknotes.add(0);
        continue;
      }

      amountLeft -=
          ((cashMap[cash]! >= ratio) ? ratio : cashMap[cash]!) *
          int.parse(cash);
      reversedBanknotes.add((cashMap[cash]! >= ratio) ? ratio : cashMap[cash]!);
    }

    if (amountLeft > 0) return [-1];

    reversedBanknotes = reversedBanknotes.reversed.toList();

    // Update keys.
    for (int i = 0; i < reversedBanknotes.length; i++) {
      // Starting from 500, 200...
      cashMap[cashMap.keys.elementAt(i)] =
          cashMap[cashMap.keys.elementAt(i)]! - reversedBanknotes[i];
    }
    return reversedBanknotes;
  }
}
