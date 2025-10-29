/// You are given a positive number n.
/// 
/// Return the smallest number x greater than or equal to n,
/// such that the binary representation of x contains only set bits
class Solution {
  int _getBitsLen(int n) {
    if (n == 0) return 1;
    int remaindersCount = 0;
    while (n > 0) {
      remaindersCount++;
      n = (n / 2).floor();
    }
    return remaindersCount;
  }

  int _binToInt(String bin) {
    int result = 0;
    for (int i = bin.length - 1; i > -1; i--) {
      result += int.parse(bin[i]) << i;
    }
    return result;
  }

  int smallestNumber(int n) {
    // Get bits of this number.
    final int len = _getBitsLen(n);
    return _binToInt('1' * len);
  }
}
