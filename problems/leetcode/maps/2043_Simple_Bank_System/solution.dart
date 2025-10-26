/// You have been tasked with writing a program for a popular bank that will
/// automate all its incoming transactions (transfer, deposit, and withdraw).
///
/// The bank has n accounts numbered from 1 to n. The initial balance of each
/// account is stored in a 0-indexed integer array balance, with the
/// (i + 1)th account having an initial balance of balance[i].
///
/// Execute all the valid transactions. A transaction is valid if:
///   - The given account number(s) are between 1 and n, and
///   - The amount of money withdrawn or transferred from is less than or equal to the balance of the account.
class Bank {
  Bank(List<int> balance) : n = balance.length {
    for (int i = 0; i < balance.length; i++) {
      balanceBook[i + 1] = balance[i];
    }
  }

  final int n;

  final Map<int, int> balanceBook = {};

  bool transfer(int account1, int account2, int money) {
    // Do they exist?
    if (account1 < 1 || n < account1) return false;
    if (account2 < 1 || n < account2) return false;

    // Does account1 have money?
    var balance1 = balanceBook[account1]!;
    if (money > balance1) return false;

    // Transaction is valid.
    balanceBook[account1] = balanceBook[account1]! - money;
    balanceBook[account2] = balanceBook[account2]! + money;
    return true;
  }

  bool deposit(int account, int money) {
    // Exists?
    if (account < 1 || n < account) return false;

    balanceBook[account] = balanceBook[account]! + money;
    return true;
  }

  bool withdraw(int account, int money) {
    // Exists?
    if (account < 1 || n < account) return false;

    // Has money?
    final balance = balanceBook[account]!;
    if (balance < money) return false;

    balanceBook[account] = balanceBook[account]! - money;
    return true;
  }
}

// void main() {
//   final bank = Bank([10, 100, 20, 50, 30]);
//   bank.transfer(2, 1, 50);
// }
