import 'package:flutter/material.dart';
import 'package:random_number_generator/component/number_to_image.dart';
import 'package:random_number_generator/constant/color.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int maxNumber = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Number(maxNumber: maxNumber),
              _Slider(
                maxNumber: maxNumber.toDouble(),
                onChanged: onSliderChanged,
              ),
              _Button(),
            ],
          ),
        ),
      ),
    );
  }

  onSliderChanged(double value) {
    setState(() {
      maxNumber = value.toInt();
    });
  }
}

class _Number extends StatelessWidget {
  final int maxNumber;

  const _Number({required this.maxNumber, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: NumberToImage(number: maxNumber));
  }
}

class _Slider extends StatelessWidget {
  final double maxNumber;
  final ValueChanged<double> onChanged;

  const _Slider({required this.maxNumber, required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: maxNumber,
      onChanged: onChanged,
      min: 1000,
      max: 100000,
      activeColor: redColor,
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text('저장!'),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: redColor,
      ),
    );
  }
}
