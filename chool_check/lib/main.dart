import 'package:chool_check/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Flutter가 잘 초기화 되었는지 확인, 주로 비동기 처리에서 사용
  await dotenv.load(fileName: 'asset/config/.env'); // 경로에 맞게 수정

  sendKeyToiOS();

  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

void sendKeyToiOS() {
  const platform = MethodChannel('com.example.chool_check/env');
  final key = dotenv.env['GOOGLE_MAPS_API_KEY'] ?? '';
  platform.invokeMethod('googleApiKey', {'apiKey': key});
}