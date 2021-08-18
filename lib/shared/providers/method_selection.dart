import 'package:flutter/material.dart';
import 'package:ordenation_mark/pages/main_content.dart';

class MethodSelection extends ChangeNotifier {
  OrdenationMehtodEnum? _method = OrdenationMehtodEnum.BubbleSort;

  OrdenationMehtodEnum? get method => _method;

  void updatemethod(OrdenationMehtodEnum? newmethod) {
    _method = newmethod;
    notifyListeners();
  }
}
