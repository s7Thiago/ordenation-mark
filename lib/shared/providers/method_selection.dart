import 'package:flutter/material.dart';
import 'package:ordenation_mark/pages/main_content.dart';

class MethodSelection extends ChangeNotifier {
  OrdenationMethodEnum? _method = OrdenationMethodEnum.bubbleSort;

  OrdenationMethodEnum? get method => _method;

  void updateMethod(OrdenationMethodEnum? newMethod) {
    _method = newMethod;
    notifyListeners();
  }
}
