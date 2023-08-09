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
import '/auth/firebase_auth/auth_util.dart';

String indexinList(String? inp) {
  inp = inp ?? '';
  String output = (int.parse(inp) + 1).toString();

  return output;
}

int? calculateAge(
  DateTime currentDate,
  String dateOfBirthString,
) {
  // Split the dateOfBirthString into day, month, and year parts
  List<String> dateParts = dateOfBirthString.split('.');

  // Convert day, month, and year parts to integers
  int day = int.parse(dateParts[0]);
  int month = int.parse(dateParts[1]);
  int year = int.parse(dateParts[2]);

  DateTime dateOfBirth = DateTime(year, month, day);

  int age = currentDate.year - dateOfBirth.year;
  if (currentDate.month < dateOfBirth.month ||
      (currentDate.month == dateOfBirth.month &&
          currentDate.day < dateOfBirth.day)) {
    age--;
  }
  return age;
}

List<String> breakLines(List<String> inputList) {
  List<String> outputList = [];

  for (String inputString in inputList) {
    List<String> words = inputString.split(' ');
    List<String> lines = [];
    String currentLine = '';

    for (String word in words) {
      if ((currentLine + (currentLine.isEmpty ? '' : ' ') + word).length <=
          40) {
        currentLine += (currentLine.isEmpty ? '' : ' ') + word;
      } else {
        lines.add(currentLine);
        currentLine = word;
      }
    }

    if (currentLine.isNotEmpty) {
      lines.add(currentLine);
    }

    outputList.add(lines.join('\n'));
  }

  return outputList;
}

String breakStringIntoLines(String inputString) {
  List<String> words = inputString.split(' ');
  List<String> lines = [];
  String currentLine = '';

  for (String word in words) {
    if ((currentLine + (currentLine.isEmpty ? '' : ' ') + word).length <= 40) {
      currentLine += (currentLine.isEmpty ? '' : ' ') + word;
    } else {
      lines.add(currentLine);
      currentLine = word;
    }
  }

  if (currentLine.isNotEmpty) {
    lines.add(currentLine);
  }

  return lines.join('\n');
}

String? clearSpace(String? text) {
  // return text without extra space
  if (text == null) {
    return null;
  }
  return text.trim().replaceAll(RegExp(r'\s+'), ' ');
}
