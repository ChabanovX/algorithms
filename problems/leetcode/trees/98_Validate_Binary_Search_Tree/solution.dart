class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

/// Given the root of a binary tree, determine if it is a valid binary
/// search tree (BST).
class Solution {
  bool isValidBST(TreeNode? root) => _helper(root, null, null);

  bool _helper(TreeNode? root, int? left, int? right) {
    if (root == null) return true;

    if ((left != null && root.val <= left) ||
        (right != null && root.val >= right)) {
      return false;
    }

    return _helper(root.left, left, root.val) && _helper(root.right, root.val, right);
  }
}
