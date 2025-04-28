import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Column(
        children: [
          Expanded(child: _Logo()),
          Expanded(child: _Image()),
          Expanded(child: _Footer()),
        ],
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.blue,
          boxShadow: [
            BoxShadow(
              color: Colors.blue[300]!,
              spreadRadius: 2.0,
              blurRadius: 12.0,
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add, color: Colors.white),
              SizedBox(width: 12.0),
              Text('Live',
                  style: TextStyle(color: Colors.white, fontSize: 30.0)),
            ],
          ),
        ),
      ),
    );
  }
}


class _Image extends StatelessWidget {
  const _Image({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset('asset/img/home_img.png'));
  }
}


class _Footer extends StatelessWidget {
  const _Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        onPressed: () {},
        child: Text('입장하기'),
      ),
    );;
  }
}
