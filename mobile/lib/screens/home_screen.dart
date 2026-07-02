import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/mic_button.dart';
import '../widgets/speech_card.dart';
import '../widgets/translation_card.dart';
import '../widgets/animation_placeholder.dart';
import '../widgets/status_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String speechText = "Hasil suara akan muncul di sini";
  String translationText = "Hasil AI akan muncul di sini";
  String status = "Idle";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              const AppHeader(),

              const SizedBox(height: 30),

              MicButton(
                onPressed: () {
                  setState(() {
                    status = "Listening...";
                    speechText = "Selamat pagi";
                    translationText = "Good Morning";
                  });
                },
              ),

              const SizedBox(height: 20),

              if (status == "Listening...")
                const CircularProgressIndicator(),

              const SizedBox(height: 20),

              SpeechCard(text: speechText),

              const SizedBox(height: 15),

              TranslationCard(text: translationText),

              const SizedBox(height: 20),

              const AnimationPlaceholder(),

              const SizedBox(height: 20),

              StatusBar(status: status),
            ],
          ),
        ),
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.history),
            label: "History",
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}