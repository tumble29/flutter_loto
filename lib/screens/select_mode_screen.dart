import 'package:flutter/material.dart';
import '/gen/gen.dart';
import '/styles/styles.dart';
import '/widgets/widgets.dart';
import '/screens/LotoScreen.dart'; // Đảm bảo import đúng đường dẫn

class SelectModeScreen extends StatelessWidget {
  const SelectModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: CustomButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: AppColors.primary,
                  child: const Icon(
                    Icons.arrow_back_rounded,
                    color: AppColors.text,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  t.selectMode.select_mode,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                      color: AppColors.text),
                ),
              ),
              const Spacer(),
              // Tùy chọn các bảng
              Center(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(16, (index) {
                    return MaterialButton(
                      color: AppColors.primary,
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: () {
                        // Điều hướng đến LotoScreen với thông tin bảng được chọn
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                LotoScreen(boardIndex: index + 1),
                          ),
                        );
                      },
                      child: Text(
                        'Board ${index + 1}',
                        style: const TextStyle(
                          color: AppColors.text,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
