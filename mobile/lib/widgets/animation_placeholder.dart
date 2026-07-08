import 'package:flutter/material.dart';

class AnimationPlaceholder extends StatelessWidget {
  const AnimationPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.sign_language,
            size: 80,
            color: Colors.indigo,
          ),
          SizedBox(height: 10),
          Text("Animation Placeholder"),
        ],
      ),
    );
  }
}