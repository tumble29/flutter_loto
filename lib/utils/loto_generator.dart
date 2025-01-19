import 'dart:math';

List<List<List<int?>>> generateLotoBoards(int boardCount, int rows, int cols) {
  final Random random = Random();
  List<List<List<int?>>> boards = [];

  for (int b = 0; b < boardCount; b++) {
    List<List<int?>> board = [];
    Set<int> usedNumbers = {}; // Tập hợp để theo dõi các số đã sử dụng
    bool hasRowWithFiveNumbers = false;

    for (int i = 0; i < rows; i++) {
      List<int?> row = List.filled(cols, null);
      List<int> continuousColumns = [];

      // Tạo hàng với 5 ô liên tiếp chứa số nếu chưa có hàng đủ 5 số
      if (!hasRowWithFiveNumbers && i == rows - 1) {
        int startCol = random.nextInt(cols - 4); // Đảm bảo còn đủ 5 ô liên tiếp
        for (int j = 0; j < 5; j++) {
          continuousColumns.add(startCol + j);
        }

        // Điền số vào các cột liên tiếp
        for (int col in continuousColumns) {
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

        hasRowWithFiveNumbers = true;
      } else {
        // Chọn ngẫu nhiên các cột khác để điền số
        List<int> filledColumns = [];

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
      }

      board.add(row);
    }

    // Nếu bảng không có hàng nào đủ 5 số, tạo một hàng như vậy
    if (!hasRowWithFiveNumbers) {
      int randomRow = random.nextInt(rows);
      int startCol = random.nextInt(cols - 4);

      for (int j = 0; j < 5; j++) {
        int col = startCol + j;
        int min = col * 10 + 1;
        int max = (col + 1) * 10;
        int number;

        do {
          number = random.nextInt(max - min + 1) + min;
        } while (usedNumbers.contains(number));

        board[randomRow][col] = number;
        usedNumbers.add(number);
      }
    }

    boards.add(board);
  }

  return boards;
}
