import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String convertIsoString(
  String iso8601String,
  String format,
) {
  DateTime startDateTime = DateTime.parse(iso8601String);
  String time12hr = DateFormat(format).format(startDateTime);
  return time12hr;
}

DateTime convertToDateTime(String dateString) {
  return DateTime.parse(dateString);
}
