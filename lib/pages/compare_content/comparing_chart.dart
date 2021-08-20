import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ordenation_mark/shared/providers/comparing_table_provider.dart';
import 'package:provider/provider.dart';
import 'package:supercharged/supercharged.dart';

class ComparingChart extends StatelessWidget {
  const ComparingChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<ComparingTableProvider>(context, listen: true);

    return Container(
      width: size.width * .5,
      height: 350,
      decoration: const BoxDecoration(color: Colors.black26),
      child: LineChart(
        LineChartData(
          minX: provider.sizes.min()!.toDouble(),
          maxX: provider.sizes.max()!.toDouble(),
          minY: 5,
          maxY: 15,
          gridData: FlGridData(horizontalInterval: 1000.0),
          lineBarsData: <LineChartBarData>[
            LineChartBarData(
              isCurved: true,
              spots: <FlSpot>[
                ...provider.sizes
                    .map((size) => FlSpot(10, size.toDouble()))
                    .toList(),
              ],
            ),
          ],
        ),
        swapAnimationDuration: const Duration(milliseconds: 500),
        swapAnimationCurve: Curves.linear,
      ),
    );
  }
}
