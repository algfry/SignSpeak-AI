import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        /// Base
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
              Color(0xFF8B2EFF),
              Color(0xFF5B3BFF),
              Color(0xFF0D47FF),
              ],
            ),
          ),
        ),

        /// Pink Glow
        Positioned(
          top: -180,
          left: -150,
          child: Container(
            width: 320,
            height: 320,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFFF4FD8).withValues(alpha: .22),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFF4FD8).withValues(alpha: .30),
                  blurRadius: 180,
                  spreadRadius: 10,
                )
              ],
            ),
          ),
        ),

        /// Blue Glow
        Positioned(
          bottom: -150,
          right: -120,
          child: Container(
            width: 340,
            height: 340,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF5B8CFF).withValues(alpha: .20),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF5B8CFF).withValues(alpha: .28),
                  blurRadius: 200,
                  spreadRadius: 70,
                )
              ],
            ),
          ),
        ),

        Positioned.fill(
          child: child,
        ),
      ],
    );
  }
}