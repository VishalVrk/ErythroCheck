import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HemoglobinChart extends StatelessWidget {
  // Sample data - replace with your actual data
  final List<FlSpot> _spots = [
    const FlSpot(0, 14.5),
    const FlSpot(1, 15.2),
    const FlSpot(2, 14.8),
    const FlSpot(3, 15.5),
    const FlSpot(4, 15.3),
    const FlSpot(5, 14.9),
    const FlSpot(6, 15.6),
    const FlSpot(7, 15.1),
    const FlSpot(8, 15.8),
    const FlSpot(9, 15.4),
  ];

  HemoglobinChart({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        // Styling and data for the chart
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: _spots,
            isCurved: true,
            color: Theme.of(context).primaryColor,
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}
