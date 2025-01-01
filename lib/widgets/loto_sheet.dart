import 'package:flutter/material.dart';
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
  const LotoSheet({super.key, required this.rowSize, required this.columnSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.black),
      child: Column(
        children: List.generate(
          columnSize,
          (index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: LotoTable(color: Colors.red, rowSize: rowSize),
            );
          },
        ),
      ),
    );
  }
}
