import 'package:flutter/material.dart';

import '/enums/enums.dart';
import '/gen/gen.dart';
import '/styles/styles.dart';
import '/widgets/widgets.dart';
import 'screens.dart';

class SelectModeScreen extends StatelessWidget {
  const SelectModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    void onGameModeSelected(GameModeEnum gameMode) {
      switch (gameMode) {
        case GameModeEnum.large:
          break;
        case GameModeEnum.medium:
          break;
      }
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SelectPlayerNumberScreen(),
          ));
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomBackButton(),
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
              ...GameModeEnum.values.map(
                (mode) {
                  return Column(
                    children: [
                      MaterialButton(
                        padding: EdgeInsets.zero,
                        splashColor: Colors.transparent,
                        onPressed: () => onGameModeSelected(mode),
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
