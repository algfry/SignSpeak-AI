import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/mic_button.dart';
import '../widgets/speech_card.dart';
import '../widgets/translation_card.dart';
import '../widgets/animation_placeholder.dart';
import '../widgets/status_bar.dart';
import '../services/audio_services.dart';
import 'history_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String speechText = "hasil suara akan muncul di sini";
  String translationText = "hasil AI akan muncul di sini";
  String status = "Idle";
  bool isRecording = false;
  int currentIndex = 0;
  final AudioService _audioService = AudioService();

  String? audioPath;

  Future<void> toggleRecording() async {
    if (!isRecording) {
      await _audioService.startRecording();

      setState(() {
        isRecording = true;
        status = "Recording...";
      });
    } else {
      audioPath = await _audioService.stopRecording();

      setState(() {
        isRecording = false;
        status = "Recording selesai";
        speechText = audioPath ?? "Audio tidak ditemukan";
      });

      print(audioPath);
    }
  }

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
                isRecording: isRecording,
                onPressed: toggleRecording, 
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
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
          currentIndex = index;
          });
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const HistoryScreen(),
              ),
           );
          }
        }, destinations: [
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