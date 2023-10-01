// játék logika

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangman/models/tipp.dart';
import 'package:hangman/views/end_view.dart';

class GameViewController extends GetxController {
  BuildContext context;
  GameViewController(this.context);

  bool isInitialized = false;

  List<String> szovegek = [
    "Az ég kéz",
    "Az ég kék",
  ];

  String kivalasztottSzoveg = "";
  String eddigEltalaltSzoveg = "";

  void randomSzovegKiavalasztas() {
    int index = Random().nextInt(szovegek.length);
    kivalasztottSzoveg = szovegek[index].toUpperCase();
    eddigEltalaltSzoveg = "";
    for (int i = 0; i < kivalasztottSzoveg.length; i++) {
      eddigEltalaltSzoveg += "*";
    }
  }

  // ha itt 7 db rossz van akkor vesztett
  List<Tipp> tippek = []; // {A,true}, {B, false), {C..

  bool gameOverEllenorzese() {
    int szamlalo = 0;
    for (var tipp in tippek) {
      if (tipp.talaltE == false) szamlalo++;
    }
    return szamlalo == 6;
  }

  bool winEllenorzese() {
    return eddigEltalaltSzoveg == kivalasztottSzoveg;
  }

  // azért kell hogy disable-ek legyenek ezek a karakterek
  bool karakterFelhasznalvaEllenozes(String tipp) {
    return tippek.map((e) => e.karakter).toList().contains(tipp);
  }

  // azért kell hogy kirajzoljuk a pálcaembert
  int rosszTippekDbSzam() {
    return tippek.where((e) => e.talaltE == false).toList().length;
  }

  // itt döntjük el, hogy a tipp az rossz vagy jó
  // ha jó akkor beillesztjük a tippükbe ahol eddig csak *** volt
  // majd rögzítjük a tippek listába a jó tippet
  // és ellenőrízzük hogy nyertünk-e

  // ha rossz a tipp, akkor hozzáadjuk a listához, hogy rossz
  // és ellenőrízzük, hogy vesztettünk-e
  void tippEllenorzese(String tipp) {
    if (kivalasztottSzoveg.contains(tipp)) {
      List<String> temp = eddigEltalaltSzoveg.split('');
      for (int i = 0; i < kivalasztottSzoveg.length; i++) {
        if (kivalasztottSzoveg[i] == tipp) {
          temp[i] = tipp;
        }
      }
      eddigEltalaltSzoveg = temp.join();
      tippek.add(Tipp(karakter: tipp, talaltE: true));
      if (winEllenorzese()) {
        Get.to(
          EndView("Gratulálok! Nyertél", rosszTippekDbSzam()),
          transition: Transition.cupertino,
        );
      }
    } else {
      tippek.add(Tipp(karakter: tipp, talaltE: false));
      if (gameOverEllenorzese()) {
        Get.to(
          EndView("Sajnos vesztettél!", rosszTippekDbSzam()),
          transition: Transition.cupertino,
        );
      }
    }
    update();
  }

  Future<void> preloadImages() async {
    for (int i = 0; i < 7; i++) {
      await precacheImage(AssetImage('images/$i.jpg'), context);
    }
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await preloadImages();
    randomSzovegKiavalasztas();
    isInitialized = true;
    update();
  }
}
