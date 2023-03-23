import 'dart:io';

/**
 * DO NOT MODIFY THE MAIN METHOD.
 *
 * @author adinashby
 */

void main(List<String> arguments) {
  // Question 1
  print(minWindow("ADOBECODEBANC", "DOC"));
  // COD

    print(minWindow("ADOBECODEBANC", "ABC"));
  // BANC

    print(minWindow("a", "a"));
  // a

      print(minWindow("a", "aa"));
  // (empty string)
}

/**
 * Please refer to the README file for question(s) description
 */

String minWindow(String s, String t) {
  if (s == "" || t == "") return "";
  if (s.isEmpty || t.isEmpty) return "";

  int n = s.length;
  int m = t.length;

  List<int> freq = List.filled(128, 0);
  int characters = 0;

  for (int i = 0; i < m; i++) {
    freq[t.codeUnitAt(i)]++;
    characters++;
  }

  int start = 0, end = 0;
  int min_length = double.maxFinite.toInt();
  int start_index = 0;

  while (end < n) {
    if (freq[s.codeUnitAt(end)] > 0) characters--;
    freq[s.codeUnitAt(end)]--;
    end++;

    while (characters == 0) {
      if (min_length > end - start) {
        min_length = end - start;
        start_index = start;
      }
      freq[s.codeUnitAt(start)]++;
      if (freq[s.codeUnitAt(start)] > 0) {
        characters++;
      }
      start++;
    }
  }

  return min_length == double.maxFinite.toInt()
      ? ""
      : s.substring(start_index, start_index + min_length);
}
