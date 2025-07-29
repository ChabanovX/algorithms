/// You are given an m x n integer matrix matrix with the following
/// two properties:
///
/// Each row is sorted in non-decreasing order.
///
/// The first integer of each row is greater than the last integer
/// of the previous row.
///
/// Given an integer target, return true if target is in matrix
/// or false otherwise.
///
/// You must write a solution in O(log(m * n)) time complexity.
class Solution {
  bool searchMatrix(List<List<int>> matrix, int target) {
    if (matrix.length == 0) return false;

    int lo = 0;
    int hi = matrix.length * matrix[0].length - 1;

    while (lo <= hi) {
      int mid = (lo + hi) ~/ 2;
      int row = mid ~/ matrix.first.length;
      int col = mid % matrix.first.length;

      int val = matrix[row][col];

      if (val == target) return true;
      else if (val < target) {
        lo = mid + 1;
      } else {
        hi = mid - 1;
      }
    }

    return false;
  }
}
