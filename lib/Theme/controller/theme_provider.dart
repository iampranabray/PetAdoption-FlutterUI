import 'package:flutter/material.dart';

class UIControllers extends ChangeNotifier {
  bool _value = true;
  bool get value => _value;

  int? _currentPageIndex = 0;
  int? get currentPageIndex => _currentPageIndex;

  themeValue() {
    _value = !(_value);
    notifyListeners();
  }

  navigation({int? value}) {
    _currentPageIndex = value;
    notifyListeners();
  }
}
