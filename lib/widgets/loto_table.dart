import 'package:flutter/material.dart';
import '/styles/styles.dart';

class LotoTable extends StatelessWidget {
  final Color color;
  final List<List<int?>> board; // Thêm tham số nhận dữ liệu bảng

  const LotoTable({super.key, required this.color, required this.board});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: AppColors.text, width: 1),
      children: board.map((row) {
        return TableRow(
          children: row.map((cell) {
            return Container(
              width: 50,
              height: 30,
              color: color.withOpacity(cell == null ? 0.1 : 0.3),
              alignment: Alignment.center,
              child: cell == null
                  ? const SizedBox.shrink()
                  : Text(
                      '$cell',
                      style: const TextStyle(
                        color: AppColors.text,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}
