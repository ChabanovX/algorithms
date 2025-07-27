enum Direction { right, down, left, up }

class Driver {
  static int dCol = 1;
  static int dRow = 0;

  static int delta = 0;
  static Direction direction = Direction.right;

  static void nextDirection() {
    if (dCol == 1 && dRow == 0) {
      dCol = 0;
      dRow = 1;
      direction = Direction.down;
    } else if (dCol == 0 && dRow == 1) {
      dCol = -1;
      dRow = 0;
      direction = Direction.left;
    } else if (dCol == -1 && dRow == 0) {
      dCol = 0;
      dRow = -1;
      direction = Direction.up;
      delta++;
    } else if (dCol == 0 && dRow == -1) {
      // Initial direction.
      dCol = 1;
      dRow = 0;
      direction = Direction.right;
    } else {
      throw Exception('Invalid derivative.');
    }
  }

  /// Leetcode caches static class, does not allow to pass tests.
  /// Had to reset class manually, so on each run is alright.
  static void reset() {
    dCol = 1;
    dRow = 0;
    delta = 0;
    direction = Direction.right;
  }
}

/// Given a positive integer n, generate an n x n matrix filled with elements from 1 to n2 in spiral order.
///
/// Example 1:
/// Input: n = 3
/// Output:
/// [[1,2,3],
/// [8,9,4],
/// [7,6,5]]
///
/// Example 2:
/// Input: n = 1
/// Output: [[1]]
class Solution {
  List<List<int>> generateMatrix(int n) {
    final List<List<int>> mx = List.filled(n, []);
    for (int i = 0; i < n; i++) {
      mx[i] = List.generate(n, (_) => 0);
    }

    // Position.
    int row = 0;
    int col = 0;

    // Main algorithm.
    final int len = n * n;
    for (int i = 1; i < len + 1; i++) {
      // Assign value.
      mx[row][col] = i;

      // Update direction.
      final int nextCol = col + Driver.dCol;
      final int nextRow = row + Driver.dRow;

      // Validate direction.
      bool isDirectionValid = true;
      switch (Driver.direction) {
        case Direction.right:
          if (nextCol >= n - Driver.delta) {
            isDirectionValid = false;
          }
          break;
        case Direction.down:
          if (nextRow >= n - Driver.delta) {
            isDirectionValid = false;
          }
          break;
        case Direction.left:
          if (nextCol < 0 + Driver.delta) {
            isDirectionValid = false;
          }
          break;
        case Direction.up:
          if (nextRow < 0 + Driver.delta) {
            isDirectionValid = false;
          }
          break;
      }

      if (!isDirectionValid) {
        Driver.nextDirection();
      }

      // Update x, y.
      col += Driver.dCol;
      row += Driver.dRow;
    }

    Driver.reset();
    return mx;
  }
}
