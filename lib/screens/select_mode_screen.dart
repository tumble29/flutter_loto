import 'package:flutter/material.dart';
import 'package:flutter_loto/widgets/custom_button.dart';

class SelectModeScreen extends StatelessWidget {
  const SelectModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: CustomButton(
                    child: Icon(Icons.arrow_back_rounded),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.orange),
              )
            ],
          ),
        ),
      ),
    );
  }
}
