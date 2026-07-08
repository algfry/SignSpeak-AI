import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import 'listening_screen.dart';
import '../widgets/mic_button.dart';
import '../widgets/gradient_background.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isRecording = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                const SizedBox(height: 70),
                
                FadeInDown(
                  child: const Text(
                    "SignSpeak AI",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: -0.8,
                      shadows: [
                        Shadow(
                          color: Colors.white54,
                          blurRadius: 18,
                        ),

                        Shadow(
                          color: Colors.black26,
                          offset: Offset(0,5),
                          blurRadius: 12,
                        ),

                      ],
                    ),
                  ),
                ),

                const Spacer(),

                FadeInUp(
                  delay: const Duration(milliseconds: 300),
                  child: MicButton(
                    isRecording: isRecording,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ListeningScreen(),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 30),

                FadeInUp(
                  delay: const Duration(milliseconds: 500),
                  child: const Text(
                    "Press to Speak",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                const Spacer(),

                const Padding(
                  padding: EdgeInsets.only(bottom: 24),
                  child: Text(
                    "Powered by AMD AI",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ), 
        ),
      ),
    );
  }
}