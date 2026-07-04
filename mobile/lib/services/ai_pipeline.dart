import 'speech_service.dart';
import 'fireworks_service.dart';
import 'sign_service.dart';

class AIPipeline {
  final SpeechService _speech = SpeechService();
  final FireworksService _fireworks = FireworksService();
  final SignService _sign = SignService();

  Future<Map<String, String>> process(String audioPath) async {
    final speech = await _speech.speechToText(audioPath);
    final translation = await _fireworks.simplifySentence(speech);
    final video = await _sign.getVideo(translation);

    return {
      "speech": speech,
      "translation": translation,
      "video": video,
    };
  }

}