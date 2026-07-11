import 'package:flutter/material.dart';
import 'package:mobile/widgets/gradient_background.dart';

import '../constants/colors.dart';
import '../widgets/result_panel.dart';
import '../widgets/sign_video_player.dart';

class TranslationScreen extends StatelessWidget {
  final String speech;
  final String translation;
  final List<String> videos;

  const TranslationScreen({
    super.key,
    required this.speech,
    required this.translation,
    required this.videos,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: GradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [

                /// VIDEO (lebih dominan)
                Expanded(
                  flex: 7,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 25,
                          offset: Offset(0, 15),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: SignVideoPlayer(
                        videos: videos,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                /// Speech + Translation (lebih kecil)
                ResultPanel(
                  speech: speech,
                  translation: translation,
                ),

                const SizedBox(height: 18),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: FilledButton.icon(
                    onPressed: () => Navigator.pop(context),
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