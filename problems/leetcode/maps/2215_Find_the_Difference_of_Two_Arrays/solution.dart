enum StatusCode {
  unassigned,
  nums1,
  nums2,
  both,
}

/// Given two 0-indexed integer arrays nums1 and nums2, return a list answer of size 2 where:
/// 
/// answer[0] is a list of all distinct integers in nums1 which are not present in nums2.
/// answer[1] is a list of all distinct integers in nums2 which are not present in nums1.
/// Note that the integers in the lists may be returned in any order.
class Solution {
  List<List<int>> findDifference(List<int> nums1, List<int> nums2) {
    final Map<int, StatusCode> map = {};
    for (final elem in nums1) {
      map.putIfAbsent(elem, () => StatusCode.unassigned);
    }
    for (final elem in nums2) {
      map.putIfAbsent(elem, () => StatusCode.unassigned);
    }

    // Mark present in [nums1].
    for (final elem in nums1) {
      map[elem] = StatusCode.nums1;
    }

    // Mark present in nums2 and note common.
    for (final elem in nums2) {
      switch (map[elem]) {
        case StatusCode.nums1:
          map[elem] = StatusCode.both;
          break;
        case StatusCode.unassigned:
          map[elem] = StatusCode.nums2;
          break;
        case StatusCode.both:
          break;
        default:
          break;
      }
    }

    // Prepare answer.
    final List<int> unique1 = [];
    final List<int> unique2 = [];

    for (final entry in map.entries) {
      switch (entry.value) {
        case StatusCode.nums1:
          unique1.add(entry.key);
          break;
        case StatusCode.nums2:
          unique2.add(entry.key);
          break;
        default:
          break;
      }
    }

    return [unique1, unique2];
  }
}
