class mapLayer {
  final int rows;
  final int cols;
  final List<List<String>> grid;

  mapLayer({required this.rows, required this.cols, required String defaultValue})
      : grid = List.generate(
      rows, (_) => List.generate(cols, (_) => defaultValue),
      );

  /// Gets the value at the specified position.
  String getValue(int row, int col) {
    if (row >= 0 && row < rows && col >= 0 && col < cols) {
      return grid[row][col];
    }
    throw RangeError('Invalid row or column index');
  }

  /// Sets the value at the specified position.
  void setValue(int row, int col, String value) {
    if (row >= 0 && row < rows && col >= 0 && col < cols) {
      grid[row][col] = value;
    } else {
      throw RangeError('Invalid row or column index');
    }
  }
}