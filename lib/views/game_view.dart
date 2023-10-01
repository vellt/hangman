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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                          "images/${controller.rosszTippekDbSzam()}.jpg"),
                      Text(
                        controller.eddigEltalaltSzoveg,
                        style: TextStyle(fontSize: 30),
                      ),
                      // Text(controller.kivalasztottSzoveg),
                      // Text(controller.rosszTippekDbSzam().toString()),
                      SizedBox(
                        height: 20,
                      ),
                      LetterButtonHolder(letterButtons: [
                        LetterButton(letter: "A", controller: controller),
                        LetterButton(letter: "Á", controller: controller),
                        LetterButton(letter: "B", controller: controller),
                        LetterButton(letter: "C", controller: controller),
                        LetterButton(letter: "D", controller: controller),
                        LetterButton(letter: "E", controller: controller),
                      ]),
                      LetterButtonHolder(letterButtons: [
                        LetterButton(letter: "É", controller: controller),
                        LetterButton(letter: "F", controller: controller),
                        LetterButton(letter: "G", controller: controller),
                        LetterButton(letter: "H", controller: controller),
                        LetterButton(letter: "I", controller: controller),
                        LetterButton(letter: "Í", controller: controller),
                      ]),
                      LetterButtonHolder(letterButtons: [
                        LetterButton(letter: "J", controller: controller),
                        LetterButton(letter: "K", controller: controller),
                        LetterButton(letter: "L", controller: controller),
                        LetterButton(letter: "M", controller: controller),
                        LetterButton(letter: "N", controller: controller),
                        LetterButton(letter: "O", controller: controller),
                      ]),
                      LetterButtonHolder(letterButtons: [
                        LetterButton(letter: "Ó", controller: controller),
                        LetterButton(letter: "Ö", controller: controller),
                        LetterButton(letter: "Ő", controller: controller),
                        LetterButton(letter: "P", controller: controller),
                        LetterButton(letter: "Q", controller: controller),
                        LetterButton(letter: "R", controller: controller),
                      ]),
                      LetterButtonHolder(letterButtons: [
                        LetterButton(letter: "S", controller: controller),
                        LetterButton(letter: "T", controller: controller),
                        LetterButton(letter: "U", controller: controller),
                        LetterButton(letter: "Ú", controller: controller),
                        LetterButton(letter: "Ü", controller: controller),
                        LetterButton(letter: "Ű", controller: controller),
                      ]),
                      LetterButtonHolder(letterButtons: [
                        LetterButton(letter: "V", controller: controller),
                        LetterButton(letter: "W", controller: controller),
                        LetterButton(letter: "X", controller: controller),
                        LetterButton(letter: "Y", controller: controller),
                        LetterButton(letter: "Z", controller: controller),
                        LetterButton(letter: " ", controller: controller),
                      ])
                    ],
                  ),
          );
        });
  }
}
