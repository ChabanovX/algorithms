/// Given a string s, reverse the order of characters in each word within a sentence while still preserving whitespace and initial word order.
///
/// Example 1:
/// Input: s = "Let's take LeetCode contest"
/// Output: "s'teL ekat edoCteeL tsetnoc"
///
/// Example 2:
/// Input: s = "Mr Ding"
/// Output: "rM gniD"
class Solution {
  String reverseWords(String s) {
    final List<String> lst = s.split('');

    int spaceIndex = s.lastIndexOf(' ');
    int charsGone = 0;

    for (int i = s.length - 1; i >= 0; i--) {
      if (i != spaceIndex) {
        charsGone++;
        lst[spaceIndex + charsGone] = s[i];
      } else {
        spaceIndex = s.lastIndexOf(' ', spaceIndex - 1);
        charsGone = 0;
      }
    }

    return lst.join();
  }
}
