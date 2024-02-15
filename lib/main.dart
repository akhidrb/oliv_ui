import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  return runApp(ChartApp());
}

class ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('David', 25),
      _ChartData('Steve', 38),
      _ChartData('Jack', 34),
      _ChartData('Others', 52)
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter chart'),
      ),
      body: Stack(children: [
        SfCircularChart(series: <CircularSeries<_ChartData, String>>[
          DoughnutSeries<_ChartData, String>(
            dataSource: data,
            xValueMapper: (_ChartData data, _) => data.category,
            yValueMapper: (_ChartData data, _) => data.amount,
            radius: '70%',
            dataLabelSettings: const DataLabelSettings(isVisible: true),
            dataLabelMapper: (_ChartData data, _) => data.amountLabel,
          )
        ]),
        SfCircularChart(annotations: const <CircularChartAnnotation>[
          CircularChartAnnotation(
            widget: Text('62K',
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 25)),
          )
        ], series: <CircularSeries<_ChartData, String>>[
          DoughnutSeries<_ChartData, String>(
            dataSource: data,
            xValueMapper: (_ChartData data, _) => data.category,
            yValueMapper: (_ChartData data, _) => data.amount,
            radius: '90%',
            innerRadius: '98%',
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              color: Colors.amber,
            ),
            dataLabelMapper: (_ChartData data, _) => data.category,
          )
        ]),
      ]),
    );
  }
}

class _ChartData {
  _ChartData(this.category, this.amount);

  final String category;
  final double amount;
  late String amountLabel = '${amount.toStringAsFixed(0)}K';
}
