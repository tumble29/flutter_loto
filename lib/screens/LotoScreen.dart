import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '/utils/loto_generator.dart';
import '/styles/styles.dart';

class LotoScreen extends StatefulWidget {
  final String mode; // Nhận chế độ chơi ('Cổ điển' hoặc 'Mở rộng')

  const LotoScreen({super.key, required this.mode});

  @override
  _LotoScreenState createState() => _LotoScreenState();
}

class _LotoScreenState extends State<LotoScreen> {
  late List<List<int?>> selectedBoard; // Bảng được chọn
  late List<List<bool>> highlighted; // Trạng thái ô được bấm

  final List<int> calledNumbers = []; // Danh sách số đã gọi
  bool isRunning = false; // Trạng thái quay số
  int? currentNumber; // Số hiện tại được gọi
  final Random random = Random();
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();

    // Xác định kích thước bảng dựa trên chế độ chơi
    final boards = widget.mode == 'Cổ điển'
        ? generateLotoBoards(16, 9, 9)
        : generateLotoBoards(16, 9, 15);

    selectedBoard = boards[0]; // Lấy bảng đầu tiên làm ví dụ

    // Khởi tạo danh sách trạng thái các ô (false = chưa bấm)
    highlighted = List.generate(
      selectedBoard.length,
      (i) => List.generate(selectedBoard[i].length, (j) => false),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose(); // Giải phóng tài nguyên
    super.dispose();
  }

  void toggleHighlight(int row, int col) {
    setState(() {
      highlighted[row][col] = !highlighted[row][col];
    });
  }

  Future<void> callNumber() async {
    if (calledNumbers.length >= 100) {
      setState(() {
        isRunning = false; // Dừng quay số nếu đã đủ 100 số
      });
      return;
    }

    // Tạo số ngẫu nhiên không trùng lặp
    int number;
    do {
      number = random.nextInt(100);
    } while (calledNumbers.contains(number));

    calledNumbers.add(number); // Lưu số vào danh sách
    setState(() {
      currentNumber = number;
    });

    // Phát âm thanh
    await audioPlayer.play(AssetSource('sounds/so_$number.mp3'));

    // Nghỉ 5 giây trước khi quay số tiếp theo
    await Future.delayed(const Duration(seconds: 5));

    // Tiếp tục quay số nếu đang chạy
    if (isRunning) {
      callNumber();
    }
  }

  void startCalling() {
    if (isRunning) return; // Nếu đang chạy thì không làm gì
    setState(() {
      isRunning = true;
    });
    callNumber();
  }

  void stopCalling() {
    setState(() {
      isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loto - Chế độ ${widget.mode}'),
        backgroundColor: AppColors.primary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    for (int row = 0; row < selectedBoard.length; row++)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int col = 0;
                              col < selectedBoard[row].length;
                              col++)
                            GestureDetector(
                              onTap: () {
                                if (selectedBoard[row][col] != null) {
                                  toggleHighlight(row, col);
                                }
                              },
                              child: Container(
                                margin: const EdgeInsets.all(4.0),
                                width: 40,
                                height: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: highlighted[row][col]
                                      ? Colors.red
                                      : Colors.blue,
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  selectedBoard[row][col]?.toString() ?? '',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            currentNumber != null
                ? 'Số hiện tại: $currentNumber'
                : 'Bắt đầu quay số',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: startCalling,
                child: const Text('Bắt đầu'),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: stopCalling,
                child: const Text('Dừng lại'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
