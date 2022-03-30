import 'package:flutter/material.dart';
import 'package:flutter_test1/ui.chart/pie_chart.dart';
import 'package:flutter_test1/ui.chart/line_chart.dart';
import 'package:flutter_test1/ui.chart/bar_chart.dart';

class ChartPage extends StatelessWidget {
  List<double> points = [50, 0, 73, 100, 150, 120, 200, 80];
  List<String> labels = [
    "2012",
    "2013",
    "2014",
    "2015",
    "2016",
    "2017",
    "2018",
    "2019",
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("ChartPage"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                child: CustomPaint(
                  size: const Size(200, 200),
                  foregroundPainter: LineChart(
                    points: points,
                    pointSize: 10.0, // 점의 크기를 정합니다.
                    lineWidth: 3.0, // 선의 굵기를 정합니다.
                    lineColor:
                        const Color.fromARGB(120, 223, 64, 251), // 선의 색을 정합니다.
                    pointColor: Colors.purpleAccent,
                  ),
                ), // 점의 색을 정합니다.
              ),
              Container(
                child: CustomPaint(
                  size: const Size(150, 150),
                  painter: PieChart(
                    percentage: 50,
                    textScaleFactor: 1.0,
                    textColor: Colors.blueGrey,
                  ),
                ),
              ),
              Container(
                child: CustomPaint(
                  size: const Size(300, 300),
                  foregroundPainter: BarChart(
                    data: points,
                    labels: labels,
                    color: Colors.pinkAccent,
                  ),
                ), // color - 막대 그래프의 색깔
              ),
            ],
          ),
        ),
      ),
    );
  }
}
