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
      height: 450,
      decoration: const BoxDecoration(color: Colors.black26),
      child: LineChart(
        LineChartData(
          minX: provider.sizes.min()!.toDouble(),
          maxX: provider.sizes.max()!.toDouble(),
          minY: 5,
          maxY: 15,
          axisTitleData: FlAxisTitleData(
            show: true,
            leftTitle: AxisTitle(
              showTitle: true,
              reservedSize: 30,
              titleText: 'Tempo em ms',
            ),
            bottomTitle: AxisTitle(
              showTitle: true,
              reservedSize: 30,
              titleText: 'Tamanho do vetor',
            ),
          ),
          titlesData: FlTitlesData(
            leftTitles: SideTitles(
              showTitles: true,
              reservedSize: 35,
            ),
            bottomTitles: SideTitles(
              showTitles: true,
              interval: 1500,
              reservedSize: 20,
            ),
          ),
          lineBarsData: <LineChartBarData>[
            LineChartBarData(
              isCurved: true,
              spots: <FlSpot>[
                // ...provider.sizes
                //     .map((size) => FlSpot(size.toDouble(), 10))
                //     .toList(),
                ...provider.spots
                // FlSpot(1000, 10),
                // FlSpot(1500, 11),
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
