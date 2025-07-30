import 'dart:collection';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

/// Given the root of a binary tree, return the average value of the nodes
/// on each level in the form of an array. Answers within 10-5 of the actual
/// answer will be accepted.
class Solution {
  List<double> averageOfLevels(TreeNode? root) {
    if (root == null) return [];

    final Queue<TreeNode> numbers = Queue()..add(root);
    final List<double> avgs = [];

    while (numbers.isNotEmpty) {
      final int level = numbers.length;
      double sum = 0;

      for (int i = 0; i < level; i++) {
        final pop = numbers.removeFirst();
        sum += pop.val;
        
        if (pop.left != null) numbers.addLast(pop.left!);
        if (pop.right != null) numbers.addLast(pop.right!);
      }

      avgs.add(sum / level);
      sum = 0;
    }

    return avgs;
  }
}
