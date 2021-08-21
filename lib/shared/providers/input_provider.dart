import 'package:flutter/widgets.dart';
import 'package:ordenation_mark/pages/learning_content/learning_content.dart';
import 'package:ordenation_mark/shared/sorting/sorting_controller.dart';

class InputProvider extends ChangeNotifier {
  int valorVetor = 0;
  int valorMedia = 0;

  final timesMap = {
    OrdenationMethodEnum.bubbleSort: <double>[],
    OrdenationMethodEnum.heapSort: <double>[],
    OrdenationMethodEnum.insertionSort: <double>[],
    OrdenationMethodEnum.mergeSort: <double>[]
  };

  executeSort(int tamanho, int qtde) {
    for (var i = 0; i < qtde; i++) {
      for (var j = 0; j < tamanho; j++) {}
    }
  }

  void updateVetor(int newValor) {
    valorVetor = newValor;
    print(valorVetor);
    notifyListeners();
  }

  void updateMedia(int newValor) {
    valorMedia = newValor;
    print(valorMedia);
    notifyListeners();
  }
}
