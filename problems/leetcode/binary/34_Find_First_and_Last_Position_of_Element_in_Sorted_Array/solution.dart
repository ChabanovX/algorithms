class Solution {
  List<int> searchRange(List<int> nums, int target) {
    // First we search left value.
    int findLeft() {
      int lo = 0;
      int hi = nums.length; // [x, y)
      while (lo < hi) {
        final int mid = (hi + lo) ~/ 2;
        if (nums[mid] < target) {
          lo = mid + 1;
        } else {
          hi = mid;
        }
      }
      return lo;
    }

    int findRight() {
      int lo = 0;
      int hi = nums.length;
      while (lo < hi) {
        final int mid = (lo + hi) ~/ 2;
        if (nums[mid] <= target) {
          lo = mid + 1;
        } else {
          hi = mid;
        }
      }
      return lo;
    }

    final left = findLeft();
    final right = findRight();

    if (left == nums.length || nums[left] != target) return [-1, -1];
    return [left, right - 1];
  }
}
