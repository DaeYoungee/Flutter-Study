import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? timer;
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      int currentPage = pageController.page!.toInt();
      int nextPage = (++currentPage) % 5;
      pageController.animateToPage(
        nextPage,
        duration: Duration(microseconds: 500),
        curve: Curves.linear,
      );
    });
  }

  @override
  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [1, 2, 3, 4, 5,]
            .map(
                (e) => Image.asset('asset/img/image_$e.jpeg')
            ).toList(),
      ),
    );
  }
}
