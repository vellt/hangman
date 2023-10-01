import 'package:flutter/cupertino.dart';
import 'package:hangman/controllers/game_view_controller.dart';

class LetterButton extends StatelessWidget {
  LetterButton({
    required this.letter,
    required this.controller,
  }) {
    isDisabled = controller.karakterFelhasznalvaEllenozes(letter);
  }
  GameViewController controller;
  String letter;
  bool isDisabled = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      padding: EdgeInsets.zero,
      onPressed: (isDisabled) ? null : () => controller.tippEllenorzese(letter),
      child: Center(
        child: Text(
          letter,
        ),
      ),
    );
  }
}
