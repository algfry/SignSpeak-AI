import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class FireworksService {
  final String apiKey = dotenv.env['FIREWORKS_API_KEY']!;

  Future<Map<String, dynamic>> translate(String text) async {

    print("===== FIREWORKS REQUEST =====");
    print(text);
    print("Speech : $text");

    final response = await http.post(
      Uri.parse("https://api.fireworks.ai/inference/v1/chat/completions"),
      headers: {
        "Authorization": "Bearer $apiKey",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "model": "accounts/fireworks/models/gpt-oss-120b",
        "max_tokens": 1024,
        "messages": [
            {

              "role": "system",
              "content": """
              Return only JSON.

              {
                "translation": "",
                "gesture": []
              }
              """
            },
            {
              "role": "user",
              "content": text
            }
        ],
      }),
    );
    print("STATUS : ${response.statusCode}");
    print("BODY :");
    print(response.body);

    if (response.statusCode == 200) {

      final data = jsonDecode(response.body);

      final result =
          data["choices"][0]["message"]["content"];

      final jsonResult = jsonEncode(result);

      print(jsonResult);

      return jsonDecode(jsonResult);
    }

    throw Exception(response.body);
  }
}
