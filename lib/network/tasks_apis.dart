// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:clock_hacks_book_reading/models/task_model.dart';
import 'package:http/http.dart' as http;
import 'package:clock_hacks_book_reading/constants/api_endpoints.dart';
import 'package:clock_hacks_book_reading/models/user_model.dart';

class TaskAPI {
  static Future<Task> createTask(String id, String password) async {
    final url = Uri.parse(APIEndpoints.login);

    http.Response response = await http.post(
      url,
      body: jsonEncode({"id": id, "password": password}),
      headers: APIEndpoints.postHeaders,
    );

    var jsonResponse = jsonDecode(response.body);

    print(jsonResponse);

    if (response.statusCode != 200) {
      throw Exception(
        jsonResponse["err"] ??
            "Failed to create task with error code ${response.statusCode}",
      );
    }

    return Task.getDummyTask();
  }

  static Future<List<Task>> getAllTask(
    String name,
    String phone,
    String email,
    String password,
  ) async {
    final url = Uri.parse(APIEndpoints.register);

    http.Response response = await http.post(
      url,
      body: jsonEncode({
        "name": name,
        "phone_number": phone,
        "email": email,
        "password": password
      }),
      headers: APIEndpoints.postHeaders,
    );

    var jsonResponse = jsonDecode(response.body);

    print(jsonResponse);

    if (response.statusCode != 200) {
      throw Exception(
        jsonResponse["err"] ??
            "Failed to login with error code ${response.statusCode}",
      );
    }

    return [Task.getDummyTask()];
  }
}
