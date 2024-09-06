import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

BarChartData transactionsBarchart(LinearGradient linearGradient) {
  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          width: 10,
          gradient: linearGradient,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 5,
            color: Colors.grey.shade300,
          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> showGroups() => List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 2);
          case 1:
            return makeGroupData(1, 3);
          case 2:
            return makeGroupData(2, 2);
          case 3:
            return makeGroupData(3, 4.5);
          case 4:
            return makeGroupData(4, 3.8);
          case 5:
            return makeGroupData(5, 1.5);
          case 6:
            return makeGroupData(6, 4);
          default:
            return throw Error();
        }
      });

  return BarChartData(
    titlesData: const FlTitlesData(
      show: true,
      // BottomAxis
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 38,
          getTitlesWidget: bottomTiles,
        ),
      ),

      // LeftAxis
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 38,
          getTitlesWidget: leftTiles,
        ),
      ),

      // RightAxis
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),

      // TopAxis
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
    ),
    borderData: FlBorderData(show: false),
    gridData: const FlGridData(show: false),
    barGroups: showGroups(),
  );
}

Widget bottomTiles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  Widget text;

  switch (value.toInt()) {
    case 0:
      text = const Text("01", style: style);
    case 1:
      text = const Text("02", style: style);
    case 2:
      text = const Text("03", style: style);
    case 3:
      text = const Text("04", style: style);
    case 4:
      text = const Text("05", style: style);
    case 5:
      text = const Text("06", style: style);
    case 6:
      text = const Text("07", style: style);
    default:
      text = const Text("", style: style);
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 16,
    child: text,
  );
}

Widget leftTiles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  String text;

  if (value == 0) {
    text = "\$ 0K";
  } else if (value == 1) {
    text = "\$ 1K";
  } else if (value == 2) {
    text = "\$ 2K";
  } else if (value == 3) {
    text = "\$ 3K";
  } else if (value == 4) {
    text = "\$ 4K";
  } else if (value == 5) {
    text = "\$ 5K";
  } else if (value == 6) {
    text = "\$ 6K";
  } else {
    return Container();
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 0,
    child: Text(text, style: style),
  );
}
