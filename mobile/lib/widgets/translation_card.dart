import 'package:flutter/material.dart';

class TranslationCard extends StatelessWidget {
  final String text;

  const TranslationCard({
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
                Icon(Icons.translate),
                SizedBox(width: 10),
                Text(
                  "Translation",
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