import 'package:flutter/material.dart';
import '../styles/app_colors.dart';
import '/widgets/loto_table.dart';

const LotoColors = [
  Colors.red,
  Colors.orange,
  Colors.purple,
  Colors.green,
  Colors.grey,
];

class LotoSheet extends StatelessWidget {
  final int rowSize;
  final int columnSize;
  final Color color;
  const LotoSheet(
      {super.key,
      required this.rowSize,
      required this.columnSize,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.background,
        border: Border.all(color: AppColors.text, width: 1),
      ),
      child: Column(
        children: List.generate(
          columnSize,
          (index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: LotoTable(color: color, rowSize: rowSize),
            );
          },
        ),
      ),
    );
  }
}
