class SpeechService {

  Future<String> speechToText(String audioPath) async {
    await Future.delayed(const Duration(seconds: 2));

    // nanti request ke API

    return "Selamat pagi";
  }

}