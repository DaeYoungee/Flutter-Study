import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectDated = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              _Top(
                selectDated: selectDated,
                onPressed: onHeartPressed
              ),

              /// 이미지
              _Bottom(),
            ],
          ),
        ),
      ),
    );
  }

  void onHeartPressed() {
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.center,
          child: Container(
            height: 300.0,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: selectDated,
              maximumDate: DateTime.now(),
              dateOrder: DatePickerDateOrder.ymd,
              onDateTimeChanged: (DateTime newDateTime) {
                setState(() {
                  selectDated = newDateTime;
                });
              },
            ),
          ),
        );
      },
    );
  }
}

class _Top extends StatelessWidget {
  final DateTime selectDated;
  final VoidCallback onPressed;

  const _Top({
    required this.selectDated,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Column(
        children: [
          Text("U&I", style: textTheme.displayLarge),
          Text("우리 처음 만날 날", style: textTheme.bodyLarge),
          Text(
            "${selectDated.year}-${selectDated.month}-${selectDated.day}",
            style: textTheme.bodyMedium,
          ),

          IconButton(
            iconSize: 60.0,
            onPressed: onPressed,
            icon: Icon(Icons.favorite, color: Colors.red),
          ),
          Text(
            "D+${now.difference(selectDated).inDays + 1}",
            style: textTheme.displayMedium,
          ),
        ],
      ),
    );
  }
}

class _Bottom extends StatelessWidget {
  const _Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Image.asset("asset/img/middle_image.png"));
  }
}
