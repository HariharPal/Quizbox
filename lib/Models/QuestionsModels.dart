import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Subject { Maths, Chemistry, Geography, English }

const subjectIcons = {
  Subject.Maths: Icons.calculate,
  Subject.Chemistry: Icons.science_rounded,
  Subject.Geography: Icons.landscape,
  Subject.English: Icons.chrome_reader_mode_outlined,
};

class Quiz {
  Quiz(
      {required this.questions,
      required this.options,
      required this.subject,
      required this.quizAnswer})
      : id = uuid.v4();

  final String questions;
  final List<String> options;
  final Subject subject;
  final int quizAnswer;
  final String id;
}
