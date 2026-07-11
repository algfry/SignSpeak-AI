import 'package:supabase_flutter/supabase_flutter.dart';

class SignService {
  final supabase = Supabase.instance.client;

  List<String> mergeGestures(List<String> words) {
    List<String> result = [];

    for (int i = 0; i < words.length; i++) {
      if (i < words.length - 1) {
        final pair = "${words[i]}_${words[i + 1]}";

        if (pair == "di_jalan" ||
            pair == "dengan_mu" ||
            pair == "salam_kenal") {
          result.add(pair);
          i++;
          continue;
        }
      }

      result.add(words[i]);
    }

    return result;
  }

  Future<List<String>> getVideos(List<String> gestures) async {
    final merged = mergeGestures(gestures);

    print("GESTURES AFTER MERGE = $merged");

    List<String> urls = [];

    for (final gesture in merged) {
      final url = supabase.storage
          .from("gestures")
          .getPublicUrl("$gesture.mp4");

      print("VIDEO: $url");

      urls.add(url);
    }

    return urls;
  }
}