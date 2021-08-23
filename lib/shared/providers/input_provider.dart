import 'package:flutter/widgets.dart';
import 'package:ordenation_mark/pages/learning_content/learning_content.dart';
import 'package:ordenation_mark/shared/sorting/all.dart';
import 'package:ordenation_mark/shared/sorting/bubble.dart';
import 'package:ordenation_mark/shared/sorting/insertion.dart';
import 'package:ordenation_mark/shared/sorting/merge.dart';
import 'package:ordenation_mark/shared/sorting/sorting_controller.dart';

class InputProvider extends ChangeNotifier {
  int tamanhoVetor = 0;
  int tamanhoVetorMax = 50000;

  int qtdeComparacoes = 0;
  int qtdeComparacoesMax = 10;

  final timesMap = {
    OrdenationMethodEnum.bubbleSort: <double>[],
    OrdenationMethodEnum.heapSort: <double>[],
    OrdenationMethodEnum.insertionSort: <double>[],
    OrdenationMethodEnum.mergeSort: <double>[]
  };

  clearTimes() {
    for (List<double> element in timesMap.values) {
      element.clear();
    }
    notifyListeners();
  }

  executeSort(int tamanho, int qtde, OrdenationMethodEnum method) {
    for (int i = 0; i < qtde; i++) {
      List<int> input = SortingController.generateRandomListUnique(tamanho);

      switch (method) {
        case OrdenationMethodEnum.bubbleSort:
          timesMap[method]!
              .add(SortingController.getExecutionTime(BubbleSort.sort, input));
          break;
        case OrdenationMethodEnum.heapSort:
          timesMap[method]!
              .add(SortingController.getExecutionTime(HeapSort.sort, input));

          break;
        case OrdenationMethodEnum.insertionSort:
          timesMap[method]!.add(
              SortingController.getExecutionTime(InsertionSort.sort, input));

          break;
        case OrdenationMethodEnum.mergeSort:
          timesMap[method]!
              .add(SortingController.getExecutionTime(MergeSort.sort, input));

          break;
      }

      print('map: $timesMap');

      notifyListeners();
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
