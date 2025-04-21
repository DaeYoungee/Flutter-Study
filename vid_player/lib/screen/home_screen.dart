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

    initializedController();
  }

  initializedController() async {
    controller = VideoPlayerController.file(File(widget.video.path));
    await controller.initialize();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: Stack(
          children: [
            VideoPlayer(controller),
            _PlayButton(
              onForwardPressed: onForwardPressed,
              onPlayPressed: onPlayPressed,
              onReversePressed: onReversePressed,
              isPlaying: controller.value.isPlaying,
            ),
            _Bottom(
              position: controller.value.position,
              maxPosition: controller.value.duration,
              onChanged: onBottomChanged,
            ),
            _PickAnotherVideo(),
          ],
        ),
      ),
    );
  }

  onPlayPressed() {
    setState(() {
      if (controller.value.isPlaying) {
        controller.pause();
      } else {
        controller.play();
      }
    });
  }

  onReversePressed() {
    Duration currentPosition = controller.value.position;
    Duration duration = Duration();
    if (currentPosition.inSeconds - 3 >= 0) {
      duration = currentPosition - Duration(seconds: 3);
    }
    controller.seekTo(duration);
  }

  onForwardPressed() {
    Duration maxPosition = controller.value.duration;
    Duration currentPosition = controller.value.position;
    Duration position = maxPosition;
    if (currentPosition.inSeconds + 3 < maxPosition.inSeconds) {
      position = currentPosition + Duration(seconds: 3);
    }
    controller.seekTo(position);
  }

  onBottomChanged(double value) {
    Duration duration = Duration(seconds: value.toInt());
    controller.seekTo(duration);
  }
}

class _PlayButton extends StatelessWidget {
  final VoidCallback onForwardPressed;
  final VoidCallback onPlayPressed;
  final VoidCallback onReversePressed;
  final bool isPlaying;

  const _PlayButton({
    required this.onForwardPressed,
    required this.onPlayPressed,
    required this.onReversePressed,
    required this.isPlaying,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            color: Colors.white,
            onPressed: onReversePressed,
            icon: Icon(Icons.rotate_left),
          ),
          IconButton(
            color: Colors.white,
            onPressed: onPlayPressed,
            icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
          ),
          IconButton(
            color: Colors.white,
            onPressed: onForwardPressed,
            icon: Icon(Icons.rotate_right),
          ),
        ],
      ),
    );
  }
}

class _Bottom extends StatelessWidget {
  final Duration position;
  final Duration maxPosition;
  final ValueChanged<double> onChanged;

  const _Bottom({
    required this.position,
    required this.maxPosition,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Slider(
        value: position.inSeconds.toDouble(),
        onChanged: onChanged,
        max: maxPosition.inSeconds.toDouble(),
      ),
    );
  }
}

class _PickAnotherVideo extends StatelessWidget {
  const _PickAnotherVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      child: IconButton(
        color: Colors.white,
        onPressed: () {},
        icon: Icon(Icons.photo_camera_back),
      ),
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
