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
        "max_tokens": 300,
        "temperature": 0.2,
        "messages": [
            {

              "role": "system",
              "content": """
              You are an Indonesian Sign Language (BISINDO/SIBI) assistant.

              Your task:

              1. Translate Indonesian speech into natural English.
              2. Extract ONLY important Indonesian words that can be mapped to sign language.
              3. Remove repeated words.
              4. Ignore filler words like "eh", "hmm", "anu", "jadi", "nih", "dong".
              5. Return ONLY valid JSON.

              Example 1

              Input:
              Selamat pagi apa kabar

              Output:
              {
                "translation":"Good morning, how are you?",
                "gesture":[
                  "selamat",
                  "pagi",
                  "apa",
                  "kabar"
                ]
              }

              Example 2

              Input:
              Saya mau makan nasi

              Output:
              {
                "translation":"I want to eat rice",
                "gesture":[
                  "saya",
                  "mau",
                  "makan",
                  "nasi"
                ]
              }

              Example 3

              Input:
              Terima kasih

              Output:
              {
                "translation":"Thank you",
                "gesture":[
                  "terima",
                  "kasih"
                ]
              }

              Return only JSON.
              
              {
                "translation": "",
                "gesture": []
              }
              
              If a word or phrase exists as a single sign language gesture,
              keep it as one gesture.

              Examples:

              "denganmu" -> "denganmu"
              "terima kasih" -> "terima_kasih"
              "di jalan" -> "di_jalan"
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

    if (response.statusCode != 200) {
      throw Exception(response.body);
    }

    final data = jsonDecode(response.body);

    final message = data["choices"][0]["message"];

    if (message["content"] == null) {
      
      print("Model hanya mengembalikan reasoning.");

      return {
      "translation": text,
      "gesture": text
        .toLowerCase()
        .split(" ")
        .toSet()
        .toList(),
      };
    }

    String content = message["content"] as String;

    // Ambil JSON saja jika ada teks tambahan
    final start = content.indexOf("{");
    final end = content.lastIndexOf("}");

    if (start == -1 || end == -1) {
      throw Exception("JSON tidak ditemukan");
    }

    content = content.substring(start, end + 1);

    print("===== CLEAN JSON =====");
    print(content);

    if (!content.contains('"gesture"')) {
      throw Exception("Model returned incomplete JSON:\n$content");
    }

    return jsonDecode(content) as Map<String, dynamic>;
  }
}
