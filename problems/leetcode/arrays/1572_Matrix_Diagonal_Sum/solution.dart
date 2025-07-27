class Solution {
  int diagonalSum(List<List<int>> mat) {
    int twoSum = 0;

    for (int i = 0; i < mat.length; i++) {
      twoSum += mat[i][i];
      twoSum += mat[i][mat.length - 1 - i];
    }

    if (mat.length % 2 == 1) {
      final middle = (mat.length / 2).floor();
      twoSum -= mat[middle][middle];
    }

    return twoSum;
  }
}
