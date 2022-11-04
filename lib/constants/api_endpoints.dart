import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class APIEndpoints {
  APIEndpoints._();

  // static final String baseUrl = "http://localhost:5000";
  static final String baseUrl =
      dotenv.env['BACKEND_URL'] ?? "http://localhost:5000";

  // Auth
  static final String login = "$baseUrl/auth/login";
  static final String register = "$baseUrl/auth/register";

  // Tasks
  static final String createTask = "$baseUrl/add";
  static final String getAllTask = "$baseUrl/";
  static String getTask(String id) => "$baseUrl/$id";
  static String updateTask(String id) => "$baseUrl/update_task/$id";

  // Headers
  static const Map<String, String> postHeaders = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };

  static Map<String, String> authHeaders(String token) => {
        HttpHeaders.authorizationHeader: "Bearer $token",
      };
}
