import 'dart:math';

List<List<List<int?>>> generateLotoBoards(int boardCount, int rows, int cols) {
  final Random random = Random();
  List<List<List<int?>>> boards = [];

  for (int b = 0; b < boardCount; b++) {
    List<List<int?>> board = [];
    Set<int> usedNumbers = {}; // Tập hợp để theo dõi các số đã sử dụng

    for (int i = 0; i < rows; i++) {
      List<int?> row = List.filled(cols, null);
      List<int> filledColumns = [];

      // Chọn ngẫu nhiên 5 cột trong số `cols` để điền số
      while (filledColumns.length < 5) {
        int col = random.nextInt(cols);
        if (!filledColumns.contains(col)) {
          filledColumns.add(col);
        }
      }

      // Điền số vào các cột đã chọn
      for (int col in filledColumns) {
        int min = col * 10 + 1;
        int max = (col + 1) * 10;
        int number;

        // Tìm số chưa được sử dụng trong khoảng [min, max]
        do {
          number = random.nextInt(max - min + 1) + min;
        } while (usedNumbers.contains(number));

        row[col] = number; // Điền số vào cột
        usedNumbers.add(number); // Đánh dấu số này đã được sử dụng
      }

      board.add(row);
    }

    boards.add(board);
  }

  return boards;
}
