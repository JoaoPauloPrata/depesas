import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar(this.label, this.value, this.percent);

  final String label;
  final double value;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          child: FittedBox(
            child: Text('${value.toStringAsFixed(2)}'),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 1.0),
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5)),
              ),
              FractionallySizedBox(
                heightFactor: percent,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5))),
              )
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(label)
      ],
    );
  }
}
