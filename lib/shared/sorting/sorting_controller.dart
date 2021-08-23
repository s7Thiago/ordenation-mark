import 'dart:math';

import 'package:ordenation_mark/pages/learning_content/learning_content.dart';

// enum OrdenationMethodEnum { bubbleSort, mergeSort, heapSort, insertionSort }

class SortingController {
// Gera uma lista de números aleatórios sem duplicata de tamanho size
  static List<int> generateRandomListUnique(int size) {
    List<int> list = [];

    Random random = Random();
    for (int i = 0; i < size; i++) {
      int newElement = random.nextInt(size);
      bool isDuplicate = false;

      if (list.length > 1) {
        for (int j = 0; j < list.length; j++) {
          if (list[j] == newElement) {
            isDuplicate = true;
            i--;
          }
        }
      }

      if (!isDuplicate) list.add(newElement);
    }
    return list;
  }

// Gera uma lista de números aleatórios de tamanho size
  static List<int> generateRandomList(int size) {
    List<int> list = [];
    Random random = Random();
    for (int i = 0; i < size; i++) {
      list.add(random.nextInt(size));
    }
    return list;
  }

  // Retorna o tempo de execução do algoritmo de ordenação
  static double getExecutionTime(Function sortFunction, List<int> list) {
    Stopwatch stopwatch = Stopwatch();
    stopwatch.start();
    sortFunction(list);
    stopwatch.stop();
    return (stopwatch.elapsedMilliseconds / 1000);
  }
}
