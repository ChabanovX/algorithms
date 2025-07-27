class Solution {
  void merge(List<int> nums1, int m, List<int> nums2, int n) {
    int i = m - 1; // Last real in nums1.
    int j = n - 1; // Last real in nums2.
    int w = nums1.length - 1; // Write index.

    while (j >= 0) {
      if (i >= 0 && nums1[i] >= nums2[j]) {
        nums1[w] = nums1[i];
        i--;
      }
      else {
        nums1[w] = nums2[j];
        j--;
      }
      w--;
    }
  }
}

/// Example 1:
/// Input: nums1 = [1,2,2,3,5,6], m = 3, nums2 = [2,5,6], n = 3
/// Output: [1,2,2,3,5,6]
/// Explanation: The arrays we are merging are [1,2,3] and [2,5,6].
/// The result of the merge is [1,2,2,3,5,6] with the underlined elements coming from nums1.
///
/// Example 2:
/// Input: nums1 = [1], m = 1, nums2 = [], n = 0
/// Output: [1]
/// Explanation: The arrays we are merging are [1] and [].
/// The result of the merge is [1].
/// Example 3:
///
/// Input: nums1 = [0], m = 0, nums2 = [1], n = 1
/// Output: [1]
/// Explanation: The arrays we are merging are [] and [1].
/// The result of the merge is [1].
/// Note that because m = 0, there are no elements in nums1. The 0 is only there to ensure the merge result can fit in nums1.
void main() {}
