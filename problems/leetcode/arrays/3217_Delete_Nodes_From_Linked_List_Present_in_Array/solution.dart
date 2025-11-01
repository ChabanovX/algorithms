/// Definition for singly-linked list.
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

/// You are given an array of integers nums and the head of a linked list.
///
/// Return the head of the modified linked list after removing all nodes from
/// the linked list that have a value that exists in nums.
class Solution {
  ListNode? firstChildNotInSet(ListNode node, Set<int> numsSet) {
    ListNode? currentNode = node.next;
    while (currentNode != null) {
      if (!numsSet.contains(currentNode.val)) return currentNode;
      currentNode = currentNode.next;
    }
    return null;
  }

  void removeChildIfInSet(ListNode node, Set<int> numsSet) {
    ListNode parent = node;
    ListNode? child = parent.next;

    // Child is valid. Check its child.
    while (child != null) {
      // Child valid.
      if (!numsSet.contains(child.val)) {
        parent = child;
        child = child.next;
      } else {
        // Skip child.
        parent.next = child.next;
        child = child.next;
      }
    }
  }

  // We keep track of tail and head.
  ListNode? modifiedList(List<int> nums, ListNode? head) {
    if (head == null) return null;

    // Transfer to set for fast lookups.
    final dangerNums = nums.toSet();

    // If head is invalid.
    if (dangerNums.contains(head.val)) {
      head = firstChildNotInSet(head, dangerNums);
      // No valid heads.
      if (head == null) return null;
    }

    // Now head is valid. Make child valid also.
    removeChildIfInSet(head, dangerNums);
    return head;
  }
}

void main() {
  final sol = Solution();
  // final head = ListNode()

  final headNode = sol.modifiedList([1, 2, 3, 4, 5], head);
}
