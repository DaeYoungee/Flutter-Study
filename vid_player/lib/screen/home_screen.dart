import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  XFile? video;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:
          video != null
              ? _VideoPlayer(video: video!)
              : VideoSelector(onTap: onLogoTap),
    );
  }

  onLogoTap() async {
    final video = await ImagePicker().pickVideo(source: ImageSource.gallery);

    setState(() {
      this.video = video;
    });
  }
}

class _VideoPlayer extends StatefulWidget {
  final XFile video;

  const _VideoPlayer({required this.video, super.key});

  @override
  State<_VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<_VideoPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.file(File(widget.video.path));

    controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: VideoPlayer(controller),
    );
  }
}

class VideoSelector extends StatelessWidget {
  final VoidCallback onTap;

  const VideoSelector({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF2A3A7C), Color(0xFF000118)],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_Logo(onTap: onTap), SizedBox(height: 20.0), _Title()],
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  final VoidCallback onTap;

  const _Logo({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset('asset/image/logo.png'),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle style = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w300,
      color: Colors.white,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('VIDEO', style: style),
        Text('PLAYER', style: style.copyWith(fontWeight: FontWeight.w700)),
      ],
    );
  }
}
