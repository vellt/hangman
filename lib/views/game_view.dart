import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangman/controllers/game_view_controller.dart';
import 'package:hangman/views/widgets/letter_button.dart';
import 'package:hangman/views/widgets/letter_button_holder.dart';

class GameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GameViewController controller = Get.put(GameViewController(context));
    return GetBuilder<GameViewController>(
        init: controller,
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Hangman"),
            ),
            body: (controller.isInitialized == false)
                ? CircularProgressIndicator()
                : Column(
                    children: [
                      Image.asset(
                          "images/${controller.rosszTippekDbSzam()}.jpg"),
                      Text(controller.eddigEltalaltSzoveg),
                      Text(controller.kivalasztottSzoveg),
                      Text(controller.rosszTippekDbSzam().toString()),
                      LetterButtonHolder(
                        letterButtons: [
                          LetterButton(letter: "A", controller: controller),
                          LetterButton(letter: "É", controller: controller),
                          LetterButton(letter: "G", controller: controller),
                          LetterButton(letter: "K", controller: controller),
                          LetterButton(letter: "B", controller: controller),
                          LetterButton(letter: "X", controller: controller),
                          LetterButton(letter: "Y", controller: controller),
                          LetterButton(letter: " ", controller: controller),
                          LetterButton(letter: "Z", controller: controller),
                          LetterButton(letter: "Á", controller: controller),
                        ],
                      ),
                      LetterButtonHolder(
                        letterButtons: [
                          LetterButton(letter: "L", controller: controller),
                          LetterButton(letter: "M", controller: controller),
                          LetterButton(letter: "Q", controller: controller),
                        ],
                      )
                    ],
                  ),
          );
        });
  }
}
