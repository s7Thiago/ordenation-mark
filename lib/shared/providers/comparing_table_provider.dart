// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:developer';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ordenation_mark/shared/sorting/bubble.dart';
import 'package:ordenation_mark/shared/sorting/heap.dart';
import 'package:ordenation_mark/shared/sorting/sorting_controller.dart';

class ComparingTableProvider extends ChangeNotifier {
  final List<DataColumn> _columns = [
    DataColumn(label: Text('Tamanho')),
  ];

  final List<DataRow> _rows = [
    DataRow(cells: [DataCell(Text('100'))]),
    DataRow(cells: [DataCell(Text('300'))]),
    DataRow(cells: [DataCell(Text('50'))]),
    DataRow(cells: [DataCell(Text('70'))]),
    DataRow(cells: [DataCell(Text('100'))]),
  ];

  List<DataColumn> get columns => _columns;
  List<DataRow> get rows => _rows;

  // Future<void> fillColumn() async {
  //   for (var row in _rows) {
  //     int entrySize = int.parse((row.cells[0].child as Text).data!);

  //     row.cells.add(
  //       DataCell(
  //         FutureBuilder(
  //           future: SortingController.getExecutionTime(
  //               BubbleSort.sort, SortingController.generateRandomList(100)),
  //           builder: (context, AsyncSnapshot snapshot) {
  //             if (snapshot.hasData) {
  //               return Text(('${snapshot.data} ms'));
  //             } else {
  //               return CircularProgressIndicator();
  //             }
  //           },
  //         ),
  //       ),
  //     );

  //     notifyListeners();
  //   }
  // }

  Future<String> getString() async {
    return await Future.delayed(Duration(milliseconds: Random().nextInt(3000)))
        .then((value) => Future.value('String demorada'));
  }

  Future<void> addColumn(String label) async {
    _columns.add(DataColumn(label: Text(label)));
    // await fillColumn();

    for (var row in _rows) {
      int entrySize = int.parse((row.cells[0].child as Text).data!);

      row.cells.add(DataCell(CircularProgressIndicator()));
      notifyListeners();
    }

    notifyListeners();
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
