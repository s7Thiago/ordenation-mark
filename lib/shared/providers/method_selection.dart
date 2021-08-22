import 'package:flutter/material.dart';
import 'package:ordenation_mark/pages/learning_content/learning_content.dart';
import 'package:ordenation_mark/shared/sorting/all.dart';
import 'package:ordenation_mark/shared/sorting/bubble.dart';
import 'package:ordenation_mark/shared/sorting/insertion.dart';
import 'package:ordenation_mark/shared/sorting/merge.dart';

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

  List<int> Function(List<int>) get methodFunction {
    switch (_method) {
      case OrdenationMethodEnum.bubbleSort:
        return BubbleSort.sort;
      case OrdenationMethodEnum.heapSort:
        return HeapSort.sort;
      case OrdenationMethodEnum.insertionSort:
        return InsertionSort.sort;
      case OrdenationMethodEnum.mergeSort:
        return MergeSort.sort;
      default:
        return (List<int> input) => <int>[];
    }
  }

  OrdenationMethodEnum? get method => _method;

  void updateMethod(OrdenationMethodEnum? newMethod) {
    _method = newMethod;
    notifyListeners();
  }
}
