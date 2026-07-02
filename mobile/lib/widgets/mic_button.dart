import 'package:flutter/material.dart';

class MicButton extends StatelessWidget {
  final VoidCallback onPressed;

  const MicButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FloatingActionButton.large(
          onPressed: onPressed,
          backgroundColor: Colors.indigo,
          child: const Icon(
            Icons.mic,
            color: Colors.white,
            size: 40,
          ),
        ),

        const SizedBox(height: 10),

        const Text(
          "Tap to Speak",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}