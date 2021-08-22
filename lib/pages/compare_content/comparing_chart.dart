import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ordenation_mark/shared/providers/chart_provider.dart';
import 'package:ordenation_mark/shared/providers/comparing_table_provider.dart';
import 'package:provider/provider.dart';
import 'package:supercharged/supercharged.dart';

class ComparingChart extends StatelessWidget {
  const ComparingChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<ComparingTableProvider>(context, listen: true);
    final chartProvider = Provider.of<ChartProvider>(context, listen: true);

    return Container(
      width: size.width * .5,
      height: 450,
      decoration: const BoxDecoration(color: Colors.black26),
      child: LineChart(
        LineChartData(
          minX: provider.sizes.min()!.toDouble() * .1,
          maxX: provider.sizes.max()!.toDouble() + 10000,
          minY: 0,
          maxY: provider.maxTime + 1.5,
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
              interval: provider.maxTime * .2,
            ),
            bottomTitles: SideTitles(
              showTitles: true,
              interval: 5000,
              reservedSize: 20,
            ),
          ),
          lineBarsData: <LineChartBarData>[
            ...chartProvider.lineCharts.values.map((e) => e['chart']).toList(),
          ],
        ),
      ),
    );
  }
}
