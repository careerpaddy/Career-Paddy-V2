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
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

double getPercentage(
  int index,
  int total,
) {
  return (index + 1) / total;
}

int getIndex(int length) {
  return length - 1;
}

double getLessonProgress(
  int points,
  int totalQuestions,
) {
  var c = points / 2;
  return (c / totalQuestions) * 100;
}

List<int> randomiseQuestions(List<QuestionsRow>? questions) {
  var all = questions!
      .map(
        (e) => e.id,
      )
      .toList();
  all.shuffle();
  return all;
}

List<int>? answerQuestion(
  List<int> questions,
  bool passed,
) {
  var random = math.Random();
  if (questions.isEmpty) {
    return []; // All questions have been answered.
  }

  if (passed) {
    questions.removeLast();
  } else {
    // If the user fails, move the question to a random position in the list.
    final randomIndex = random.nextInt(questions.length);
    final failedQuestion = questions.removeLast();
    questions.insert(randomIndex, failedQuestion);
  }

  return questions;
}

List<String> textArray(String text) {
  List<String> nameList = text.split(RegExp(r',\s*'));
  return nameList;
}

String arrayText(List<String> skills) {
  String commaSeparatedString = skills.join(',');
  return commaSeparatedString;
}

List<String> timeSlots() {
  List<String> timeSlots = [];
  for (int hour = 0; hour < 24; hour++) {
    for (int minute = 0; minute < 60; minute += 30) {
      String hourStr = (hour % 12).toString().padLeft(2, '0');
      String minuteStr = minute.toString().padLeft(2, '0');
      String period = hour < 12 ? 'AM' : 'PM';
      timeSlots.add('$hourStr:$minuteStr $period');
    }
  }
  return timeSlots;
}

String formatDate(DateTime date) {
// Add 30 minutes to the given DateTime
  DateTime newDateTime = date.add(Duration(minutes: 30));

  // Format the original and new DateTimes as time strings
  String originalTime = DateFormat.jm().format(date);
  String newTime = DateFormat.jm().format(newDateTime);

  // Combine them into a time range string
  String timeRange = '$originalTime - $newTime';

  return timeRange;
}

String roundUpPercentage(double percentage) {
  return percentage.toStringAsFixed(2);
}

String capitalizeEachWord(String name) {
  List<String> words = name.trim().split(' ');

  // Remove any empty strings from the list
  words.removeWhere((word) => word.isEmpty);

  // Capitalize each word
  for (int i = 0; i < words.length; i++) {
    words[i] = '${words[i][0].toUpperCase()}${words[i].substring(1)}';
  }

  // Join the words back into a string
  return words.join(' ');
}

String formatTime(int seconds) {
  int minutes = seconds ~/ 60;
  int remainingSeconds = seconds % 60;

  String minutesStr = minutes.toString().padLeft(2, '0');
  String secondsStr = remainingSeconds.toString().padLeft(2, '0');

  return '$minutesStr:$secondsStr';
}
