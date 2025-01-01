import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loto/screens/intro.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.baloo2TextTheme(textTheme)),
      home: Intro(),
    );
  }
}
