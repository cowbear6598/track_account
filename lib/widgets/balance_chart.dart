import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:track_account/theme/colors.dart';

LineChartData balanceChartData() {
  Widget bottomTitleWidget(double value, TitleMeta meta) {
    const textStyle = TextStyle(color: Color(0xff68737d), fontSize: 12);

    Widget text;

    switch (value.toInt()) {
      case 2:
        text = const Text('1', style: textStyle);
        break;
      case 5:
        text = const Text('11', style: textStyle);
        break;
      case 11:
        text = const Text('21', style: textStyle);
        break;
      default:
        text = const Text('', style: textStyle);
        break;
    }

    return SideTitleWidget(axisSide: meta.axisSide, child: text);
  }

  Widget leftTitleWidget(double value, TitleMeta meta) {
    const textStyle = TextStyle(
        color: Color(0xff67727d), fontSize: 14);

    Widget text;

    switch (value.toInt()) {
      case 1:
        text = const Text('10k', style: textStyle, textAlign: TextAlign.center);
        break;
      case 3:
        text = const Text('50k', style: textStyle, textAlign: TextAlign.center);
        break;
      case 5:
        text =
            const Text('100k', style: textStyle, textAlign: TextAlign.center);
        break;
      default:
        text = const Text(
          '',
          style: textStyle,
          textAlign: TextAlign.center,
        );
        break;
    }

    return SideTitleWidget(axisSide: meta.axisSide, child: text);
  }

  return LineChartData(
      gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          drawHorizontalLine: true,
          horizontalInterval: 1,
          getDrawingHorizontalLine: (value) {
            return FlLine(color: const Color(0xff37500d), strokeWidth: 1);
          }),
      titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 28,
                  getTitlesWidget: bottomTitleWidget)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  interval: 1,
                  getTitlesWidget: leftTitleWidget))),
      borderData: FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Color(0xff37500d), width: 1),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        )
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
            spots: [
              const FlSpot(0, 0),
              const FlSpot(2.6, 2),
              const FlSpot(4.9, 5),
              const FlSpot(6.8, 3.1),
              const FlSpot(8, 4),
              const FlSpot(9.5, 3),
              const FlSpot(11, 4)
            ],
            isCurved: true,
            color: primary,
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(show: false))
      ]);
}
