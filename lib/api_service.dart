import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://127.0.0.1:8000';  // Change this to your backend's URL

  // Fetch craft items
  Future<List<dynamic>> fetchCraftItems() async {
    final response = await http.get(Uri.parse('$baseUrl/api/craft-items/'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);  // Parse JSON data
    } else {
      throw Exception('Failed to load craft items');
    }
  }

  // Add a new craft item
  Future<void> addCraftItem(Map<String, dynamic> newItem) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/craft-items/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(newItem),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add craft item');
    }
  }
}
