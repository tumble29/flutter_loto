import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'gen/gen.dart';
import 'screens/intro.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.baloo2TextTheme(textTheme)),
      home: const Intro(),
    );
  }
}
