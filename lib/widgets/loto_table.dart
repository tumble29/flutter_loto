import 'package:flutter/material.dart';

class LotoTable extends StatelessWidget {
  final Color color;
  final int rowSize;
  const LotoTable({super.key, required this.color, required this.rowSize});

  @override
  Widget build(BuildContext context) {
    return Table(
        border: TableBorder.all(color: color, width: 1),
        children: List.generate(3, (index) {
          return TableRow(
              children: List.generate(rowSize, (index) {
            return SizedBox(
              width: 50,
              height: 30,
            );
          }));
        }));
  }
}
