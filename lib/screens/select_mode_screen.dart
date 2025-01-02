import 'package:flutter/material.dart';

import '/config/config.dart';
import '/gen/gen.dart';
import '/styles/styles.dart';
import '/widgets/widgets.dart';

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
              ...GameModes.values.map(
                (mode) {
                  return Column(
                    children: [
                      MaterialButton(
                        padding: EdgeInsets.zero,
                        splashColor: Colors.transparent,
                        onPressed: () {},
                        child: Column(
                          children: [
                            LotoSheet(
                              color: LotoColors[mode.index],
                              rowSize: mode.description.rowSize,
                              columnSize: 1,
                            ),
                            const SizedBox(height: 8),
                            Center(
                              child: Text(mode.description.name,
                                  style: const TextStyle(fontSize: 20)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
