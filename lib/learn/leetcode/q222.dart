class Solution {

  int countNodes(TreeNode? root) {
    return _countNodes(root);
  }

  int _countNodes(TreeNode? node) {
    if (node == null) {
      return 0;
    }
    return 1 + _countNodes(node.left) + _countNodes(node.right);
  }
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;

  TreeNode([this.val = 0, this.left, this.right]);
}
