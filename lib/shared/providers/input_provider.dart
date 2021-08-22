import 'package:flutter/widgets.dart';
import 'package:ordenation_mark/pages/learning_content/learning_content.dart';
import 'package:ordenation_mark/shared/providers/chart_provider.dart';

class InputProvider extends ChangeNotifier {
  int tamanhoVetor = 0;
  int qtdeComparacoes = 0;

  final timesMap = {
    OrdenationMethodEnum.bubbleSort: <double>[],
    OrdenationMethodEnum.heapSort: <double>[],
    OrdenationMethodEnum.insertionSort: <double>[],
    OrdenationMethodEnum.mergeSort: <double>[]
  };

  executeSort(int tamanho, int qtde, OrdenationMethodEnum method) {
    for (var i = 0; i < qtde; i++) {
      for (var j = 0; j < tamanho; j++) {}
    }
  }

  void updateTamanhoVetor(int newValor) {
    tamanhoVetor = newValor;
    print('tamanho: $tamanhoVetor');
    notifyListeners();
  }

  void updateQtdeComparacoes(int newValor) {
    qtdeComparacoes = newValor;
    print('comparacoes: $qtdeComparacoes');
    notifyListeners();
  }
}
