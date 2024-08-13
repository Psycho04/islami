import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String lang = 'ar';

  set newLang(String newLang) {
    lang = newLang;
    notifyListeners();
  }
}

