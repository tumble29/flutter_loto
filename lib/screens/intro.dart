import 'package:flutter/material.dart';
import '../styles/styles.dart';
import '/gen/gen.dart';
import 'screens.dart';
import '/widgets/widgets.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/intro_bg.png',
            fit: BoxFit.cover,
          ),
          SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.9),
                    shape: BoxShape.circle),
                child: Image.asset('assets/images/game_logo.png', width: 400),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    CustomButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SelectModeScreen(),
                          ),
                        );
                      },
                      color: AppColors.primary,
                      child: SizedBox(
                        width: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              t.intro.play,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 30),
                            ),
                            const SizedBox(width: 10),
                            const Icon(Icons.queue_play_next_sharp),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    CustomButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsScreen(),
                          ),
                        );
                      },
                      color: AppColors.secondary,
                      child: SizedBox(
                        width: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              t.intro.settings,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 30),
                            ),
                            const SizedBox(width: 10),
                            const Icon(Icons.settings),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
