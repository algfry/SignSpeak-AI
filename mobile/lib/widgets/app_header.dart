import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

    @override
  Widget build(BuildContext context) {
    return const Column(
      children: [

        Icon(
          Icons.sign_language,
          size: 70,
          color: Colors.indigo,
        ),

        SizedBox(height: 10),

        Text(
          "SignSpeak AI",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: 5),

        Text(
          "SignSpeak AI Breaking Communication Barriers\nPowered by AMD AI",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
