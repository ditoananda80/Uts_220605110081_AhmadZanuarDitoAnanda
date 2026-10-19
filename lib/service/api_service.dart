import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/game_model.dart';

class ApiService {
  static const String baseUrl = 'https://www.freetogame.com/api';

  static Future<List<Game>> fetchGames() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/games'));
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        return body.map((dynamic item) => Game.fromJson(item)).toList();
      } else {
        throw Exception('Gagal memuat data API');
      }
    } catch (e) {
      throw Exception('Kesalahan Koneksi: $e');
    }
  }

  // Tambahan untuk mengambil detail game berdasarkan ID
  static Future<Game> fetchGameDetail(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/game?id=$id'));
      if (response.statusCode == 200) {
        Map<String, dynamic> body = jsonDecode(response.body);
        return Game.fromJson(body);
      } else {
        throw Exception('Gagal memuat detail game');
      }
    } catch (e) {
      throw Exception('Kesalahan Koneksi Detail: $e');
    }
  }
}