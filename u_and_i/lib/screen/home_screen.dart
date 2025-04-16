import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              _Top(),

              /// 이미지
              _Bottom(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Top extends StatefulWidget {
  const _Top({super.key});

  @override
  State<_Top> createState() => _TopState();
}

class _TopState extends State<_Top> {
  DateTime selectDated = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Column(
        children: [
          Text("U&I", style: textTheme.displayLarge),
          Text("우리 처음 만날 날", style: textTheme.bodyLarge),
          Text("${selectDated.year}-${selectDated.month}-${selectDated.day}", style: textTheme.bodyMedium),

          IconButton(
            iconSize: 60.0,
            onPressed: () {
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
            },
            icon: Icon(Icons.favorite, color: Colors.red),
          ),
          Text("D+${now.difference(selectDated).inDays+1}", style: textTheme.displayMedium),
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
