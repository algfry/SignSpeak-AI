import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignSpeak AI"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            const Text(
              "Breaking Communication Barriers",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 40),

            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.mic),
              label: const Text("Tap to Speak"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
              ),
            ),

            const SizedBox(height: 30),

            const Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Speech",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text("Hasil suara akan muncul di sini"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 15),

            const Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Translation",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text("Hasil AI akan muncul di sini"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Expanded(
              child: Center(
                child: Icon(
                  Icons.sign_language,
                  size: 100,
                  color: Colors.indigo,
                ),
              ),
            ),

            const Text(
              "Status : Idle",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}