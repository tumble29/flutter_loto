import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color color;
  const CustomButton({
    super.key,
    required this.child,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();
    return ButtonTheme(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: color.withOpacity(0.5), width: 5),
        borderRadius: BorderRadius.circular(10),
      ),
      buttonColor: color,
      child: MaterialButton(
        padding: const EdgeInsets.all(5),
        color: color,
        onPressed: () {
          player.setAsset('assets/sounds/button_click.mp3');
          player.play();
          onPressed();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.7),
                color,
                color.withOpacity(0.8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}
