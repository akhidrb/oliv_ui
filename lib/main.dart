import 'package:flutter/material.dart';
import 'package:oliv_ui/expense_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'expense_repo.dart';

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
  late List<ExpenseModel> data;

  @override
  void initState() {
    data = ExpenseRepo.getExpenses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SfCircularChart(series: <CircularSeries<ExpenseModel, String>>[
          DoughnutSeries<ExpenseModel, String>(
            dataSource: data,
            xValueMapper: (ExpenseModel data, _) => data.category,
            yValueMapper: (ExpenseModel data, _) => data.amount,
            radius: '60%',
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              textStyle: TextStyle(color: Colors.white),
            ),
            dataLabelMapper: (ExpenseModel data, _) => data.amountLabel,
            selectionBehavior: SelectionBehavior(enable: true),
          )
        ]),
        SfCircularChart(annotations: <CircularChartAnnotation>[
          CircularChartAnnotation(
            widget: SizedBox(
              height: 100,
              width: 65,
              child: Column(children: [
                const SizedBox(height: 20),
                Container(
                  height: 30,
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'EGP',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 30,
                  child: Text(
                    ExpenseRepo.getTotalExpense().amountLabel!,
                    style: const TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
              ]),
            ),
          )
        ], series: <CircularSeries<ExpenseModel, String>>[
          DoughnutSeries<ExpenseModel, String>(
            dataSource: data,
            xValueMapper: (ExpenseModel data, _) => data.category,
            yValueMapper: (ExpenseModel data, _) => data.amount,
            radius: '90%',
            innerRadius: '98%',
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              labelIntersectAction: LabelIntersectAction.shift,
              useSeriesColor: true,
              connectorLineSettings: ConnectorLineSettings(
                  length: '20%', type: ConnectorType.curve),
            ),
            dataLabelMapper: (ExpenseModel data, _) => data.category,
          )
        ]),
      ]),
    );
  }
}
