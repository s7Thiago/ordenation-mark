import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartProvider extends ChangeNotifier {
  final Map<String, Map<String, dynamic>> _lineCharts = {
    'b': {
      'chart': LineChartBarData(isCurved: true),
      'spots': <FlSpot>[],
    },
    'h': {
      'chart': LineChartBarData(isCurved: true),
      'spots': <FlSpot>[],
    },
    'i': {
      'chart': LineChartBarData(isCurved: true),
      'spots': <FlSpot>[],
    },
    'm': {
      'chart': LineChartBarData(isCurved: true),
      'spots': <FlSpot>[],
    },
  };

  Map<String, Map<String, dynamic>> get lineCharts => _lineCharts;

  void addSpot(String label,
      {required double time, required int size, required Color methodColor}) {
    _lineCharts[label[0].toLowerCase()]!['spots']
        .add(FlSpot(size.toDouble(), time));

    _lineCharts[label[0].toLowerCase()]!['chart'] = LineChartBarData(
      spots: _lineCharts[label[0].toLowerCase()]!['spots'],
      colors: [methodColor],
      isCurved: true,
    );
    notifyListeners();
  }

  void newLineChart(String label, Color methodColor) {
    _lineCharts[label[0].toLowerCase()]!['chart'] = LineChartBarData(
      isCurved: true,
      colors: [methodColor],
    );
    notifyListeners();
  }

  void removeLineChart(String label) {
    // Remove todos as linhas de gráfico gravadas para esse label
    _lineCharts[label[0].toLowerCase()]!['spots'] = <FlSpot>[];
    _lineCharts[label[0].toLowerCase()]!['chart'] = LineChartBarData(
      isCurved: true,
    );
  }
}
