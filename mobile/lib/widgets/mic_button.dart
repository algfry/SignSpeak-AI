import 'package:flutter/material.dart';

class MicButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isRecording;

  const MicButton({
    super.key,
    required this.onPressed,
    required this.isRecording,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FloatingActionButton.large(
          onPressed: onPressed,
          backgroundColor: isRecording ? Colors.red :Colors.indigo,
          child: Icon(
            isRecording ? Icons.stop : Icons.mic,
            color: Colors.white,
            size: 40,
          ),
        ),

        const SizedBox(height: 10),

        Text(
          isRecording ? "Recording..." : "Press to Speak",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}