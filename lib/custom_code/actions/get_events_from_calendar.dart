// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> getEventsFromCalendar(String accessToken) async {
  final headers = {
    'Authorization': 'Bearer $accessToken',
    'Content-Type': 'application/json',
  };
  final response = await http.get(
    Uri.parse(
        'https://www.googleapis.com/calendar/v3/calendars/primary/events'),
    headers: headers,
  );
  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonresponse = json.decode(response.body);
    final List<dynamic> events = jsonresponse['items'];
    return events;
  } else {
    print('Filed to fetch events : ${response.statusCode}');
    print('Response body: ${response.body}');
    return [];
  }
}
