import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineChartSample extends StatelessWidget {
  const LineChartSample({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      Center(
        child: LineChart(
          LineChartData(
            gridData: const FlGridData(show: false),
            titlesData: const FlTitlesData(show: false),
            borderData: FlBorderData(
              show: false,
            ),
            lineTouchData: const LineTouchData(
              enabled: false,
            ),
            // minX: 0,
            // maxX: 7,
            // minY: 0,
            // maxY: 6,
            lineBarsData: [
              LineChartBarData(
                spots: [
                  const FlSpot(0, 3),
                  const FlSpot(1, 1),
                  const FlSpot(2, 4),
                  const FlSpot(3, 2),
                  const FlSpot(4, 5),
                  const FlSpot(5, 3),
                  const FlSpot(6, 4),
                ],
                isCurved: false,
                color: const Color.fromARGB(255, 31, 255, 15),
                dotData: const FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
              ),
            ],
          ),
        ),
         );
  }
}
