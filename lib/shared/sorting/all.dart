import 'dart:math';
import 'package:collection/algorithms.dart';

// ignore: slash_for_doc_comments
/**
 * O presente arquivo contém as implementações das funções de ordenação de modo que possam ser testadas em um ambiente mais simples com dart puro
*/
void main() {
  List<int> input = generateRandomListUnique(10000);

  print('bubble sort time: ${getExecutionTime(HeapSort.sort, input)} ms');
}

// Gera uma lista de números aleatórios sem duplicata de tamanho size
List<int> generateRandomListUnique(int size) {
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

// Dart Merge sort
List<int> merge(List<int> list) {
  mergeSort(list);
  return list;
}

// Dart insertion sort
List<int> insertion(List<int> list) {
  insertionSort(list);
  return list;
}

// Método que realiza uma ordenação por bubble sort
List<int> bubble(List<int> list) {
  for (int i = 0; i < list.length; i++) {
    for (int j = 0; j < list.length - 1; j++) {
      if (list[j] > list[j + 1]) {
        int num = list[j];
        list[j] = list[j + 1];
        list[j + 1] = num;
      }
    }
  }
  return list;
}

// Retorna o tempo de execução do algoritmo de ordenação
double getExecutionTime(Function sortFunction, List<int> list) {
  Stopwatch stopwatch = Stopwatch();
  stopwatch.start();
  sortFunction(list);
  stopwatch.stop();
  return (stopwatch.elapsedMilliseconds / 1000);
}

// Heap sort implementation
class HeapSort {
  static void _heapify(List list, int n, int i) {
    int largest = i;
    int l = 2 * i + 1;
    int r = 2 * i + 2;

    if (l < n && list[l] > list[largest]) {
      largest = l;
    }

    if (r < n && list[r] > list[largest]) {
      largest = r;
    }

    if (largest != i) {
      _swapList(list, i, largest);
      _heapify(list, n, largest);
    }
  }

  static void _swapList(List list, int i, int largest) {
    int swap = list[i];
    list[i] = list[largest];
    list[largest] = swap;
  }

  static void _heapSort(List list) {
    int n = list.length;
    for (int i = (n ~/ 2); i >= 0; i--) {
      _heapify(list, n, i);
    }

    for (int i = n - 1; i >= 0; i--) {
      _swap(list, i);
      _heapify(list, i, 0);
    }
  }

  static void _swap(List list, int i) {
    int temp = list[0];
    list[0] = list[i];
    list[i] = temp;
  }

  static List<int> sort(List<int> list) {
    _heapSort(list);
    return list;
  }
}
