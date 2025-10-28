/// You are given an integer array nums.
///
/// Start by selecting a starting position curr such that nums[curr] == 0,
/// and choose a movement direction of either left or right.
///
/// After that, you repeat the following process:
/// - If curr is out of the range [0, n - 1], this process ends.
///
/// - If nums[curr] == 0, move in the current direction by incrementing curr
/// if you are moving right, or decrementing curr if you are moving left.
///
/// - Else if nums[curr] > 0:
/// Decrement nums[curr] by 1.
///
/// Reverse your movement direction (left becomes right and vice versa).
/// Take a step in your new direction.
///
/// A selection of the initial position curr and movement direction is considered
/// valid if every element in nums becomes 0 by the end of the process.
///
/// Return the number of possible valid selections.
class Solution {
  int countValidSelections(List<int> nums) {
    if (nums.length == 1) return 2;
    int valids = 0;
    final zeroIdx = [];
    for (int i = 0; i < nums.length; i++) {
      if (nums[i] == 0) zeroIdx.add(i);
    }

    // Dynamically update leftSum and rightSum.
    int leftSum = 0;
    int rightSum = 0;
    int lastIdx = -1;

    for (final idx in zeroIdx) {
      // Update left-right sums.
      if (lastIdx != -1) {
        leftSum += nums.sublist(lastIdx, idx).fold(0, (s, x) => s + x);
        rightSum -= nums.sublist(lastIdx, idx).fold(0, (s, x) => s + x);
      } else {
        leftSum += nums.sublist(0, idx).fold(0, (s, x) => s + x);
        rightSum += nums.sublist(idx, nums.length).fold(0, (s, x) => s + x);
      }

      final diff = (leftSum - rightSum);
      switch (diff) {
        case 0:
          valids += 2;
        case 1 || -1:
          valids += 1;
      }
      lastIdx = idx;
    }

    return valids;
  }
}
