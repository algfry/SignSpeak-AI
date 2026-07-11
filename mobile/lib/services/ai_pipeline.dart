import 'speech_service.dart';
import 'fireworks_service.dart';
import 'sign_service.dart';

class AIPipeline {
  final SpeechService _speech = SpeechService();
  final FireworksService _fireworks = FireworksService();
  final SignService _sign = SignService();

  Future<Map<String, dynamic>> process() async {

    // 1. Speech To Text
    final speech = await _speech.listen();

    // 2. Fireworks AI
    final ai = await _fireworks.translate(speech);

    final gestures = _sign.mergeGestures(
      List<String>.from(ai["gesture"]),
    );

    final translation = ai["translation"] as String;

    // 4. Cari video gesture
    final videos = await _sign.getVideos(gestures);

    return {
      "speech": speech,
      "translation": ai["translation"],
      "videos": videos,
    };
  }
}