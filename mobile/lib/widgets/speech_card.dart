import 'package:flutter/material.dart';

class SpeechCard extends StatelessWidget {
  final String text;

  const SpeechCard({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Row(
              children: [
                Icon(Icons.record_voice_over),
                SizedBox(width: 10),
                Text(
                  "Speech",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Text(text),
          ],
        ),
      ),
    );
  }
}