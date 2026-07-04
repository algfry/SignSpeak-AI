class FireworksService {

  Future<String> simplifySentence(String text) async {
    await Future.delayed(const Duration(seconds: 1));

    return "AI Translation: $text";
  }

} 