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
    runPipeline();
  }

  Future<void> runPipeline() async {
    try {
      final pipeline = AIPipeline();

      final result = await pipeline.process();

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => TranslationScreen(
            speech: result["speech"]!,
            translation: result["translation"]!,
            videoPath: result["video"]!,
          
            ),
          ),
        );
      } catch (e) {

        print("Error");
        print(e);

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