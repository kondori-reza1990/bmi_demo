import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final TextEditingController heightCtl = TextEditingController();
  final TextEditingController weightCtl = TextEditingController();
  double bmi = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI"),
        centerTitle: true,
      ),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SfRadialGauge(
              title: GaugeTitle(
                  text: 'BMI',
                  textStyle: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold)),
              axes: <RadialAxis>[
                RadialAxis(startAngle: -180,endAngle: 0,minimum: 15, maximum: 40, ranges: <GaugeRange>[
                  GaugeRange(
                      startValue: 15,
                      endValue: 18.5,
                      color: Colors.red,
                      startWidth: 10,
                      endWidth: 10),
                  GaugeRange(
                      startValue: 18.5,
                      endValue: 24.5,
                      color: Colors.green,
                      startWidth: 10,
                      endWidth: 10),
                  GaugeRange(
                      startValue: 24.5,
                      endValue: 30,
                      color: Colors.orange,
                      startWidth: 10,
                      endWidth: 10),
                  GaugeRange(
                      startValue: 30,
                      endValue: 40,
                      color: Colors.red,
                      startWidth: 10,
                      endWidth: 10)
                ], pointers: <GaugePointer>[
                  NeedlePointer(value: bmi)
                ], annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                      widget: Container(
                        child: Text(
                          bmi.toStringAsFixed(1),
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      angle: 90,
                      positionFactor: 0.5)
                ])
              ]),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(labelText: "قد"),
              controller: heightCtl,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(labelText: "وزن"),
              controller: weightCtl,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
            () {
              bmi = getBmi(
                weight: int.parse(weightCtl.text),
                height: int.parse(heightCtl.text),
              );
            },
          );
        },
        child: const Icon(
          color: Colors.white,
          Icons.play_arrow,
        ),
      ),
    );
  }
}

double getBmi({
  required int weight,
  required int height,
}) {
  double heightToMeter = height / 100;
  return weight / (heightToMeter * heightToMeter);
}
