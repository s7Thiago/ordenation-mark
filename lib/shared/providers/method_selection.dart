import 'package:flutter/material.dart';
import 'package:ordenation_mark/pages/learning_content/learning_content.dart';

class MethodSelection extends ChangeNotifier {
  OrdenationMethodEnum? _method = OrdenationMethodEnum.bubbleSort;
  String _title = "Bubble Sort";

  String get title {
    switch (_method) {
      case OrdenationMethodEnum.bubbleSort:
        return "Bubble Sort";
      case OrdenationMethodEnum.heapSort:
        return "Heap Sort";
      case OrdenationMethodEnum.insertionSort:
        return "Insertion Sort";
      case OrdenationMethodEnum.mergeSort:
        return "Merge Sort";
      default:
        return "Invalido";
    }
  }

  OrdenationMethodEnum? get method => _method;

  void updateMethod(OrdenationMethodEnum? newMethod) {
    _method = newMethod;
    notifyListeners();
  }
}
