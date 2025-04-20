import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color.dart';
import 'package:random_number_generator/screen/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> numbers = [123, 456, 789];

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

              /// 앱바
              _Header(onPressed: onSettingIconPressed),

              /// 랜덤 난수
              _Body(numbers: numbers),

              /// 버튼
              _Footer(onPressed: generateRandomNumber),
            ],
          ),
        ),
      ),
    );
  }

  generateRandomNumber() {
    Random random = Random();
    final Set<int> randomNumbers = {};
    while (randomNumbers.length < 3) {
      final randomNumber = random.nextInt(1000);
      randomNumbers.add(randomNumber);
    }
    setState(() {
      numbers = randomNumbers.toList();
    });
  }

  onSettingIconPressed() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) {
          return SettingScreen();
        })
    );
  }
}

class _Header extends StatelessWidget {
  final VoidCallback onPressed;

  const _Header({
    required this.onPressed,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "랜덤 난수 생성기",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        IconButton(
          onPressed: onPressed,
          icon: Icon(Icons.settings),
          color: redColor,
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  List<int> numbers;

  _Body({required this.numbers, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children:
        numbers
            .map((e) => e.toString().split(''))
            .map(
              (e) =>
              Row(
                children:
                e
                    .map(
                      (number) =>
                      Image.asset(
                        'asset/img/$number.png',
                        width: 50.0,
                        height: 70.0,
                      ),
                )
                    .toList(),
              ),
        )
            .toList(), // Text('123', style: TextStyle(color: Colors.white)),
        // Text('123', style: TextStyle(color: Colors.white)),
        // Text('123', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  final VoidCallback onPressed;

  const _Footer({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text('생성하기!', style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: redColor,
      ),
    );
  }
}
