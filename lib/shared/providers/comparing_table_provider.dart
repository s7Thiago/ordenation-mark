// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:ordenation_mark/shared/providers/chart_provider.dart';
import 'package:ordenation_mark/shared/sorting/bubble.dart';
import 'package:ordenation_mark/shared/sorting/sorting_controller.dart';
import 'package:provider/provider.dart';
import 'package:supercharged/supercharged.dart';

class ComparingTableProvider extends ChangeNotifier {
  final List<DataColumn> _columns = [
    DataColumn(label: Text('Tamanho')),
  ];

  final List<DataRow> _rows = [
    DataRow(cells: [DataCell(Text('1000'))]),
    DataRow(cells: [DataCell(Text('5000'))]),
    DataRow(cells: [DataCell(Text('10000'))]),
    DataRow(cells: [DataCell(Text('30000'))]),
    DataRow(cells: [DataCell(Text('50000'))]),
  ];

  final Map<String, List<double>> _times = {
    'b': <double>[],
    'h': <double>[],
    'i': <double>[],
    'm': <double>[],
  };

  double _maxTime = 1.0;

  double get maxTime => _maxTime;

  updateMaxTime(double newValue) {
    if (_maxTime < newValue) {
      _maxTime = newValue;
    } else {
      _maxTime = maxTime - .04;
    }

    notifyListeners();
    print('                                               (max: $maxTime)');
  }

  OrdenationMethodEnum? _selectedMethod;

  OrdenationMethodEnum? get selectedMethod => _selectedMethod;

  updateSelectedMethod(OrdenationMethodEnum? methodEnum) {
    _selectedMethod = methodEnum;
    notifyListeners();
  }

  Color get methodColor {
    switch (_selectedMethod) {
      case OrdenationMethodEnum.bubbleSort:
        return Colors.amber;
      case OrdenationMethodEnum.mergeSort:
        return Colors.green;
      case OrdenationMethodEnum.heapSort:
        return Colors.deepOrange;
      case OrdenationMethodEnum.insertionSort:
        return Colors.purple;
      default:
        return Colors.black;
    }
  }

  List<int> get sizes {
    return _rows
        .map((row) => int.parse((row.cells[0].child as Text).data!))
        .toList();
  }

  bool _isUiLocked = false;

  bool get isUiLocked => _isUiLocked;

  void switchUiLock() {
    _isUiLocked = !_isUiLocked;
    notifyListeners();
  }

  List<DataColumn> get columns => _columns;
  List<DataRow> get rows => _rows;
  Map<String, List<double>> get times => _times;

  Future<void> addColumn(String label, List<int> Function(List<int>) method,
      BuildContext context) async {
    _columns.add(DataColumn(label: Text(label)));
    // await fillColumn();

    for (var row in _rows) {
      row.cells.add(DataCell(CircularProgressIndicator()));
      notifyListeners();
    }

    for (var row in _rows) {
      int entrySize = int.parse((row.cells[0].child as Text).data!);
      List<int> input = SortingController.generateRandomList(entrySize);

      await Future.delayed(Duration(milliseconds: (entrySize * .3).toInt()))
          .then((value) {
        double executionTime = SortingController.getExecutionTime(
          BubbleSort.sort,
          input,
        );
        row.cells.removeLast();
        row.cells.add(DataCell(Text(
          '$executionTime ms',
          style: TextStyle(
            color: methodColor,
            fontWeight: FontWeight.bold,
          ),
        )));
        notifyListeners();

        return executionTime;
      }).then((value) {
        // Após encontrar o tempo, adiciona ao map que será plotado no gráfico
        _times[label[0].toLowerCase()]!.add(value);

        updateMaxTime(value);

        // addSpot(label, time: value, size: entrySize);
        Provider.of<ChartProvider>(context, listen: false).addSpot(
          label,
          time: value,
          size: entrySize,
          methodColor: methodColor,
        );

        // print('$value Added to chart: $_times');
        notifyListeners();
      });
    }

    // Se a interface estiver bloqueada, desbloqueia
    if (_isUiLocked) switchUiLock();
  }

  void removeColumn(String label) {
    int index =
        _columns.indexWhere((element) => (element.label as Text).data == label);
    _columns.removeWhere((element) => (element.label as Text).data == label);

    for (var row in _rows) {
      row.cells.removeAt(index);
    }

    // Remove todos os tempos gravados para esse label
    _times[label[0].toLowerCase()] = [];

    if (_columns.length == 0) {
      _maxTime = 0.0;
    }

    notifyListeners();
  }
}
