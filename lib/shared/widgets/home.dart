import 'package:flutter/material.dart';
import 'package:ordenation_mark/shared/sorting/bubble.dart';
import 'package:ordenation_mark/shared/sorting/heap.dart';
import 'package:ordenation_mark/shared/sorting/insertion.dart';
import 'package:ordenation_mark/shared/sorting/merge.dart';
import 'package:ordenation_mark/shared/widgets/ordenation_view.dart';

class Home extends StatelessWidget {
  List<int> _input = [5, 4, 80, 12, 17, 2, 87, 102, 45];

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ordenation Mark'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OrdenationView(
                  items: [..._input],
                  methodName: 'Bubble',
                  method: BubbleSort.sort,
                ),
                OrdenationView(
                  items: [..._input],
                  methodName: 'Insertion',
                  method: InsertionSort.sort,
                ),
                OrdenationView(
                  items: [..._input],
                  methodName: 'Merge',
                  method: MergeSort.sort,
                ),
                OrdenationView(
                  items: [..._input],
                  methodName: 'Heap',
                  method: HeapSort.sort,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
