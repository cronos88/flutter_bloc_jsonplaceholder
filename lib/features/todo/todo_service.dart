import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/data.dart';

class TodoService {
  final uri = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<Data>> fetchData() async {
    http.Response response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List<dynamic>)
          .map((e) => Data.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
