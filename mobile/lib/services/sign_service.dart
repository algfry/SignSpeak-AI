import 'package:supabase_flutter/supabase_flutter.dart';

class SignService {
  final supabase = Supabase.instance.client;

  Future<List<String>> getVideos(List<String> gestures) async {
    List<String> urls = [];

    for (final word in gestures) {
      final data = await supabase
          .from('gestures')
          .select('video_url')
          .eq('keyword', word)
          .maybeSingle();

      if (data != null) {
        urls.add(data['video_url']);
        print("FOUND: ${data['video_url']}");
      } else {
        print("Gesture tidak ditemukan: $word");
      }
    }

    return urls;
  }
}