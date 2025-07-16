/// lib/Services/quran_api_service.dart
library;

import 'dart:convert';
import 'package:http/http.dart' as http;

class QuranApiService {
  static Future<List<Map<String, dynamic>>> fetchSurahList() async {
    final response = await http.get(
      Uri.parse('http://api.alquran.cloud/v1/surah'),
    );
    final json = jsonDecode(response.body);

    if (json['code'] == 200) {
      return List<Map<String, dynamic>>.from(json['data']);
    } else {
      throw Exception("Failed to load Surah list");
    }
  }
}
