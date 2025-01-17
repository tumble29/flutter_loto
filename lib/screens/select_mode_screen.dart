import 'package:flutter/material.dart';
import '/styles/styles.dart';
import '/widgets/widgets.dart';
import '/screens/LotoScreen.dart'; // Đảm bảo đường dẫn đến file LotoScreen đúng

class SelectModeScreen extends StatelessWidget {
  const SelectModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onGameModeSelected(String gameMode) {
      // Chuyển hướng đến màn hình LotoScreen với thông tin chế độ chơi
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LotoScreen(mode: gameMode),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                padding: EdgeInsets.zero,
                splashColor: Colors.transparent,
                onPressed: () => onGameModeSelected('Cổ điển'),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.red,
                  ),
                  child: const Text(
                    'Cổ điển',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20), // Khoảng cách giữa hai nút
              MaterialButton(
                padding: EdgeInsets.zero,
                splashColor: Colors.transparent,
                onPressed: () => onGameModeSelected('Mở rộng'),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.green,
                  ),
                  child: const Text(
                    'Mở rộng',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
