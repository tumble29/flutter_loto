import 'package:flutter/material.dart';
import '/utils/loto_generator.dart';
import '/styles/styles.dart';
import '/widgets/loto_table.dart';

class LotoScreen extends StatelessWidget {
  final int boardIndex; // Nhận chỉ số bảng được chọn

  LotoScreen({super.key, required this.boardIndex});

  @override
  Widget build(BuildContext context) {
    final List<List<List<int?>>> boards = generateLotoBoards(16, 9, 9);
    final List<List<int?>> selectedBoard =
        boards[boardIndex - 1]; // Bảng được chọn

    return Scaffold(
      appBar: AppBar(
        title: Text('Loto Board $boardIndex'),
        backgroundColor: AppColors.primary,
      ),
      body: Center(
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: LotoTable(
              color: Colors.blue,
              board: selectedBoard,
            ),
          ),
        ),
      ),
    );
  }
}
