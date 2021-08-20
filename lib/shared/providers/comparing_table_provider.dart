// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:developer';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ordenation_mark/shared/sorting/bubble.dart';
import 'package:ordenation_mark/shared/sorting/sorting_controller.dart';

class ComparingTableProvider extends ChangeNotifier {
  final List<DataColumn> _columns = [
    DataColumn(label: Text('Tamanho')),
  ];

  final List<DataRow> _rows = [
    DataRow(cells: [DataCell(Text('1000'))]),
    DataRow(cells: [DataCell(Text('3000'))]),
    DataRow(cells: [DataCell(Text('10000'))]),
    DataRow(cells: [DataCell(Text('15000'))]),
    DataRow(cells: [DataCell(Text('20000'))]),
  ];

  List<int> get sizes {
    return _rows
        .map((row) => int.parse((row.cells[0].child as Text).data!))
        .toList();
  }

  List<DataColumn> get columns => _columns;
  List<DataRow> get rows => _rows;

  Future<String> getString({double executionTime = 0.0}) async {
    return await Future.delayed(Duration(milliseconds: executionTime.toInt()))
        .then((value) => Future.value('String demorada'));
  }

  Future<void> addColumn(
      String label, List<int> Function(List<int>) method) async {
    _columns.add(DataColumn(label: Text(label)));
    // await fillColumn();

    for (var row in _rows) {
      row.cells.add(DataCell(CircularProgressIndicator()));
      notifyListeners();
    }

    for (var row in _rows) {
      int entrySize = int.parse((row.cells[0].child as Text).data!);
      List<int> input = SortingController.generateRandomList(entrySize);

      await Future.delayed(Duration(seconds: 4)).then((value) {
        double executionTime = SortingController.getExecutionTime(
          BubbleSort.sort,
          input,
        );
        row.cells.removeLast();
        row.cells.add(DataCell(Text('$executionTime ms')));
        notifyListeners();

        return executionTime;
      }).then((value) {
        // Após encontrar o tempo, adiciona ao gráfico
        print('$value Added to chart');
      });
      // print('Esperando...');
    }
  }

  void removeColumn(String label) {
    int index =
        _columns.indexWhere((element) => (element.label as Text).data == label);
    _columns.removeWhere((element) => (element.label as Text).data == label);

    for (var row in _rows) {
      row.cells.removeAt(index);
    }

    notifyListeners();
  }
}
