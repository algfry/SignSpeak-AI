import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import '../services/ai_pipeline.dart';
import '../widgets/gradient_background.dart';
import '../widgets/mic_button.dart';
import 'translation_screen.dart';

class ListeningScreen extends StatefulWidget {
  const ListeningScreen({super.key});

  @override
  State<ListeningScreen> createState() => _ListeningScreenState();
}

class _ListeningScreenState extends State<ListeningScreen> {

  @override
  void initState() {
    super.initState();

      Future.delayed(
      const Duration(milliseconds: 700),
      () {
        runPipeline();
      },
    );
  } 

  Future<void> runPipeline() async {
    try {
      print("=== STEP 1 ===");

      final pipeline = AIPipeline();

      print("=== STEP 2 ===");

      final result = await pipeline.process();

      print("=== STEP 3 ===");
      print(result);

      if (!mounted) return;

      print(result);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => TranslationScreen(
            speech: result["speech"],
            translation: result["translation"],
            videos: List<String>.from(result["videos"]),
          ),
        ),
      );

      print("=== STEP 4 ===");

    } catch (e, s) {
      print("ERROR:");
      print(e);
      print(s);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [

                const SizedBox(height: 80),

                FadeInDown(
                  child: const Text(
                    "Listening...",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                const Spacer(),

                FadeIn(
                  child: MicButton(
                    isRecording: true,
                    onPressed: () {},
                  ),
                ),

                const SizedBox(height: 30),

                const CircularProgressIndicator(
                  color: Colors.white,
                ),

                const Spacer(),

                const Padding(
                  padding: EdgeInsets.only(bottom: 24),
                  child: Text(
                    "Powered by AMD AI",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}