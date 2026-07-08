import 'package:flutter/material.dart';
import 'package:mobile/widgets/gradient_background.dart' show GradientBackground;

import '../constants/colors.dart';
import '../widgets/result_panel.dart';
import '../widgets/sign_video_player.dart';

class TranslationScreen extends StatelessWidget {
  final String speech;
  final String translation;
  final String videoPath;

  const TranslationScreen({
    super.key,
    required this.speech,
    required this.translation,
    required this.videoPath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

    body: GradientBackground(
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              flex: 6,
              child: Container(
                width: double.infinity,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .25),
                      blurRadius: 35,
                      offset: const Offset(0, 20),
                    ),
                  ],
                ),

                clipBehavior: Clip.antiAlias,

                child: SignVideoPlayer(
                  videoPath: videoPath,
                ),
              ),
            ),

            const SizedBox(height: 20),

            ResultPanel(
              speech: speech,
              translation: translation,
            ),

            const SizedBox(height: 18),

            SizedBox(
              width: double.infinity,
              height: 58,
              child: FilledButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.mic),
                label: const Text("Speak Again"),
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