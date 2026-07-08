import 'package:speech_to_text/speech_to_text.dart';

class SpeechService {
  final SpeechToText _speech = SpeechToText();

  Future<String> listen() async {

    bool available = await _speech.initialize();

    if (!available) {
      throw Exception("Speech recognition unavailable");
    }

    String result = "";

    await _speech.listen(
      localeId: "id_ID",
      onResult: (value) {
        result = value.recognizedWords;
      },
    );

    while (_speech.isListening) {
      await Future.delayed(const Duration(milliseconds: 300));
    }

    return result;
  }
}