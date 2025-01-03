import 'package:flutter/material.dart';

import '/styles/styles.dart';
import 'widgets.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: CustomButton(
        onPressed: () {
          Navigator.pop(context);
        },
        color: AppColors.successLight,
        child: const Icon(
          Icons.arrow_back_rounded,
          color: AppColors.text,
        ),
      ),
    );
  }
}
