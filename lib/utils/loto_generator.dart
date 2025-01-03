import 'dart:math';

List<List<List<int?>>> generateLotoBoards(int boardCount, int rows, int cols) {
  final Random random = Random();
  List<List<List<int?>>> boards = [];

  for (int b = 0; b < boardCount; b++) {
    List<List<int?>> board = [];
    for (int i = 0; i < rows; i++) {
      List<int?> row = [];
      for (int j = 0; j < cols; j++) {
        // 50% xác suất ô trống (null), 50% ngẫu nhiên từ 0 đến 99
        row.add(random.nextBool() ? random.nextInt(100) : null);
      }
      board.add(row);
    }
    boards.add(board);
  }

  return boards;
}
