import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/gen/gen.dart';
import '/styles/styles.dart';
import '/widgets/widgets.dart';

class SelectPlayerNumberScreen extends StatefulWidget {
  const SelectPlayerNumberScreen({super.key});

  @override
  State<SelectPlayerNumberScreen> createState() =>
      _SelectPlayerNumberScreenState();
}

class _SelectPlayerNumberScreenState extends State<SelectPlayerNumberScreen> {
  static const maxPlayers = 99;
  final playerNumberFieldController = TextEditingController(text: '1');
  void onPlayerNumberFieldChange(String str) {
    var value = int.tryParse(str);
    if (value == null || value < 0) value = 0;
    if (value > maxPlayers) value = maxPlayers;
    playerNumberFieldController.text = value.toString();
  }

  void changePlayerNumber(int num) {
    final newValue = int.parse(playerNumberFieldController.text) + num;
    if (newValue < 0 || newValue > maxPlayers) return;
    playerNumberFieldController.text = newValue.toString();
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
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
              t.selectPlayerNumber.select_player_number,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 40,
                color: AppColors.text,
              ),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                style: const ButtonStyle(
                  padding: WidgetStatePropertyAll(EdgeInsets.all(20)),
                ),
                onPressed: () => changePlayerNumber(-1),
                child: Assets.icons.pngs.leftArrow.image(height: 40, width: 40),
              ),
              SizedBox(
                width: 200,
                child: TextField(
                  controller: playerNumberFieldController,
                  keyboardType: const TextInputType.numberWithOptions(),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: onPlayerNumberFieldChange,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(99),
                      borderSide: const BorderSide(
                        color: AppColors.text,
                        width: 3,
                      ),
                    ),
                  ),
                ),
              ),
              OutlinedButton(
                style: const ButtonStyle(
                  padding: WidgetStatePropertyAll(EdgeInsets.all(20)),
                ),
                onPressed: () => changePlayerNumber(1),
                child:
                    Assets.icons.pngs.rightArrow.image(height: 40, width: 40),
              ),
            ],
          ),
          const Spacer(flex: 2),
          CustomButton(
            onPressed: () {},
            color: AppColors.primary,
            child: Text(
              t.selectPlayerNumber.play,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
          ),
          const SizedBox(height: 16)
        ],
      ),
    )));
  }
}
