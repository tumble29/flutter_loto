import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_loto/screens/screens.dart';
import 'package:flutter_loto/widgets/custom_button.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/intro_bg.png',
            fit: BoxFit.cover,
          ),
          SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Image.asset('assets/game_logo.png', width: 200),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    CustomButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectModeScreen(),
                          ),
                        );
                      },
                      color: Colors.green,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.queue_play_next_sharp),
                          Text(
                            "Play!",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 30),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    CustomButton(
                      onPressed: () {},
                      color: Colors.grey,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.settings),
                          Text(
                            "Settings",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 30),
                          )
                        ],
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
