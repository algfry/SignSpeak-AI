import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SignVideoPlayer extends StatefulWidget {
  final List<String> videos;

  const SignVideoPlayer({
    super.key,
    required this.videos,
  });

  @override
  State<SignVideoPlayer> createState() => _SignVideoPlayerState();
}

class _SignVideoPlayerState extends State<SignVideoPlayer> {

  VideoPlayerController? controller;

  int currentIndex = 0;

  bool _changingVideo = false;

  Future<void> loadVideo(int index) async {

    controller?.removeListener(_videoListener);
    await controller?.dispose();

    controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.videos[index]),
    );

    await controller!.initialize();

    await controller!.setVolume(0);
    await controller!.setLooping(false);
    controller!
      ..addListener(_videoListener)
      ..setLooping(false);

    await controller!.play();
    

    if (mounted) {
      setState(() {});
    }
    _changingVideo = false;
  }

  void _videoListener() {

    if (controller == null) return;

    final value = controller!.value;

    if (!value.isInitialized) return;

    if (_changingVideo) return;

    if (value.duration != Duration.zero &&
        value.position >=
            value.duration - const Duration(milliseconds: 100)) {

      _changingVideo = true;

      currentIndex++;

      if (currentIndex < widget.videos.length) {

        print("NEXT VIDEO -> ${widget.videos[currentIndex]}");

        loadVideo(currentIndex);

      } else {

        print("ALL VIDEOS FINISHED");
      }
    }
}

  @override
  void initState() {
    super.initState();

    if (widget.videos.isNotEmpty) {
      loadVideo(0);
    }
  }

  @override
  void dispose() {
    controller?.removeListener(_videoListener);
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if (widget.videos.isEmpty) {
      return const Center(
        child: Text(
          "Gesture not found",
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    if (controller == null ||
        !controller!.value.isInitialized) {

      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(26),
      child: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: SizedBox(
            width: controller!.value.size.width,
            height: controller!.value.size.height,
            child: VideoPlayer(controller!),
          ),
        ),
      ),
    );
  }
}