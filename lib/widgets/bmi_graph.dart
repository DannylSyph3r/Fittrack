import 'package:flutter/material.dart';

class BMIBarGraph extends StatelessWidget {
  const BMIBarGraph({super.key, required this.graphInputBMI});

  final double graphInputBMI;
  final double minValue = 5;
  final double maxValue = 80;
  final double trackLength = 300;

  @override
  Widget build(BuildContext context) {
    double pointerPosition = ((graphInputBMI - minValue) / (maxValue - minValue)) * trackLength;

    return SizedBox(
      height: 60,
      child: Stack(
        children: [
          Container(
            height: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey[300],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey[300]!,
                    width: 2,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: _getColor(graphInputBMI),
                  ),
                ),
              ),
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey[300]!,
                    width: 2,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 8,
            left: pointerPosition,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
                border: Border.all(
                  color: Colors.grey[300]!,
                  width: 2,
                ),
              ),
              child: Center(
                child: Text(
                  graphInputBMI.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getColor(double bmi) {
    if (bmi < 18.5) {
      return Colors.blue;
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return Colors.green;
    } else if (bmi >= 25 && bmi < 29.9) {
      return Colors.orange;
    } else if (bmi >= 30 && bmi <=39.9) {
      return Colors.red;
    } else {
      return const Color.fromARGB(255, 255, 17, 0);
    }
  }
}
