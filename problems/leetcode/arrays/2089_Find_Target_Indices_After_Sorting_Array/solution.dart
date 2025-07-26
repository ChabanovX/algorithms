class Solution {
  List<int> targetIndices(List<int> nums, int target) {
    int countOfLess = 0;
    int countOfTarget = 0;
    
    for (int i = 0; i < nums.length; i++) {
      if (nums[i] < target) {
        countOfLess++;
      }
      else if (nums[i] == target) {
        countOfTarget++;
      }
    }

    if (countOfTarget == 0) {
      return [];
    }

    final List<int> result = [];
    for (int i = 0; i < countOfTarget; i++) {
      result.add(countOfLess + i);
    }

    return result;
  }
}
