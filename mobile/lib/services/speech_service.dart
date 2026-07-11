import 'dart:async';

import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechService {
  final SpeechToText _speech = SpeechToText();

  Future<String> listen() async {
    final permission = await Permission.microphone.request();

    if (!permission.isGranted) {
      throw Exception("Microphone permission denied");
    }

    final completer = Completer<String>();

    String recognized = "";

    bool available = await _speech.initialize(
      onStatus: (status) {
        print(status);
      },
      onError: (error) {
        print("ERROR: $error");

        if (!completer.isCompleted) {
          completer.complete(recognized);
        }
      },
    );

    if (!available) {
      throw Exception("Speech unavailable");
    }

    await _speech.listen(
      localeId: "in_ID",
      partialResults: false,
      cancelOnError: false,
      listenFor: const Duration(seconds: 20),
      pauseFor: const Duration(seconds: 5),

      onResult: (value) {

        print("===== CALLBACK =====");
        print(value.recognizedWords);
        print("final = ${value.finalResult}");

        if (value.recognizedWords.isNotEmpty) {
          recognized = value.recognizedWords;
        }

        if (value.finalResult &&
            !completer.isCompleted) {

          completer.complete(recognized);
        }
},
    );

    print("WAITING...");

    final result = await completer.future;

    print("AFTER WAIT");

    print(result);

    return result;
  }
}