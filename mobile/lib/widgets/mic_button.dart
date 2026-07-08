import 'package:flutter/material.dart';
import '../constants/colors.dart';

class MicButton extends StatelessWidget {
  final bool isRecording;
  final VoidCallback onPressed;

  const MicButton({
    super.key,
    required this.isRecording,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),

        width: isRecording ? 150 : 130,
        height: isRecording ? 150 : 130,

        decoration: BoxDecoration(
          shape: BoxShape.circle,

          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 255, 108, 243),
              AppColors.primary,
              Color.fromARGB(255, 245, 113, 227),
            ],
          ),

          boxShadow: [
            BoxShadow(
              color: const Color(0xFF6C63FF).withValues(alpha: .45),
              blurRadius: 40,
              spreadRadius: 8,
            ),

            BoxShadow(
              color: const Color(0xFFFF4FD8).withValues(alpha: .28),
              blurRadius: 70,
              spreadRadius: 18,
            ),

          ],
        ),

        child: Icon(
          isRecording ? Icons.stop_rounded : Icons.mic_rounded,
          color: Colors.white,
          size: 70,
        ),
      ),
    );
  }
}