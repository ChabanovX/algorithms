class Solution {
  int diagonalSum(List<List<int>> mat) {
    final int middleIndex = (mat.length / 2).floor();
    final bool isOddLen = mat.length % 2 == 1;

    int twoSum = 0;

    for (int i = 0; i < mat.length; i++) {
      twoSum += mat[i][i];

      if (!(i == middleIndex && isOddLen)) {
        twoSum += mat[i][mat.length - 1 - i];
      }
    }

    return twoSum;
  }
}
