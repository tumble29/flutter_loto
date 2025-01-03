import 'package:flutter/material.dart';
import '../styles/app_colors.dart';
import '/widgets/loto_table.dart';

class LotoSheet extends StatelessWidget {
  final List<List<int?>> board; // Bảng dữ liệu 2D
  final Color color;

  const LotoSheet({
    super.key,
    required this.board,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.background,
        border: Border.all(color: AppColors.text, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: LotoTable(
          color: color,
          board: board,
        ),
      ),
    );
  }
}
