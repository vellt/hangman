import 'package:flutter/material.dart';
import 'package:hangman/views/widgets/letter_button.dart';

class LetterButtonHolder extends StatelessWidget {
  const LetterButtonHolder({
    required this.letterButtons,
  });

  final List<LetterButton> letterButtons;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: letterButtons,
      ),
    );
  }
}
