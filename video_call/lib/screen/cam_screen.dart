import 'package:flutter/material.dart';

class CamScreen extends StatefulWidget {
  const CamScreen({super.key});

  @override
  State<CamScreen> createState() => _CamScreenState();
}

class _CamScreenState extends State<CamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Live')),
      body: Stack(
        children: [
          Container(color: Colors.red),
          Container(width: 120.0, height: 160.0, color: Colors.blue),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: ElevatedButton(onPressed: () {}, child: Text('나가기')),
          ),
        ],
      ),
    );
  }
}
