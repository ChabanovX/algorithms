import 'dart:collection';

/// Given an m x n 2D binary grid grid which represents a map of '1's
/// (land) and '0's (water), return the number of islands.
class Solution {
  int numIslands(List<List<String>> grid) {
    int m = grid.length;
    int n = grid.first.length;
    int count = 0;

    // Traverse full matrix.
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] == '0') continue;

        count++;
        _bfs(grid, i, j);
      }
    }

    return count;
  }

  void _bfs(List<List<String>> grid, int i, int j) {
    final Queue<(int, int)> queue = Queue()..add((i, j));
    while (queue.isNotEmpty) {
      final popped = queue.removeFirst();

      final row = popped.$1;
      final col = popped.$2;

      grid[row][col] = '0'; // Mark as visited.

      // Find all valid neighbors.
      const List<(int, int)> dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)];
      for (final dir in dirs) {
        final dRow = row + dir.$1;
        final dCol = col + dir.$2;
        if (_isInBoundaries(grid, dRow, dCol) && grid[dRow][dCol] != '0') {
          queue.add((dRow, dCol));
          grid[dRow][dCol] = '0';
        }
      }
    }
  }

  bool _isInBoundaries(List<List<String>> mx, int i, int j) {
    if (!(0 <= i && i < mx.length)) {
      return false;
    }

    if (!(0 <= j && j < mx.first.length)) {
      return false;
    }

    return true;
  }
}
