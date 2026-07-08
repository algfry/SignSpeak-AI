import 'dart:ui';
import 'package:flutter/material.dart';

class ResultPanel extends StatelessWidget {
  final String speech;
  final String translation;

  const ResultPanel({
    super.key,
    required this.speech,
    required this.translation,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 15,
          sigmaY: 15,
        ),
        child: Container(
          padding: const EdgeInsets.all(22),

          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: .15),

            borderRadius: BorderRadius.circular(22),

            border: Border.all(
              color: Colors.white24,
            ),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                "Speech",
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                speech,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Divider(
                color: Colors.white24,
                height: 30,
              ),

              const Text(
                "Translation",
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                translation,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}