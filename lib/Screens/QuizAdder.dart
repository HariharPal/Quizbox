import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Quizbox/DummyData/Quizdata.dart';
import 'package:Quizbox/Models/QuestionsModels.dart';

class NewQuiz extends StatefulWidget {
  const NewQuiz({super.key, required this.quizSaver});
  final void Function(Quiz Quiz) quizSaver;
  @override
  State<NewQuiz> createState() => _NewQuizState();
}

class _NewQuizState extends State<NewQuiz> {
  final _QuestionController = TextEditingController();
  final _Option1 = TextEditingController();
  final _Option2 = TextEditingController();
  final _Option3 = TextEditingController();
  final _Option4 = TextEditingController();
  Subject _selectedSubject = Subject.Maths;
  var _selectedAnswer = "Option 1";

  void _QuizSave() {
    if (_QuestionController.text.trim().isEmpty ||
        _Option1.text.trim().isEmpty ||
        _Option2.text.trim().isEmpty ||
        _Option3.text.trim().isEmpty ||
        _Option4.text.trim().isEmpty) {
      _showError();
      return;
    }
    widget.quizSaver(
      Quiz(
        questions: _QuestionController.text,
        options: [_Option1.text, _Option2.text, _Option3.text, _Option4.text],
        subject: _selectedSubject,
        quizAnswer: int.parse(_selectedAnswer.substring(7)),
      ),
    );
    Navigator.pop(context);
  }

  void _showError() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Invalid Input"),
        content: const Text(
            "Please make sure a valid title , amount , date and category were entered ."),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text("Okay"))
        ],
      ),
    );
  }

  @override
  void dispose() {
    _QuestionController.dispose();
    _Option1.dispose();
    _Option2.dispose();
    _Option3.dispose();
    _Option4.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 10)),
          const Text(
            "Add New Quiz",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Question",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  DropdownButton(
                    value: _selectedSubject,
                    items: Subject.values
                        .map((subject) => DropdownMenuItem(
                            value: subject,
                            child: Text(
                              subject.name.toUpperCase(),
                              style: const TextStyle(fontSize: 17),
                            )))
                        .toList(),
                    onChanged: (value) {
                      setState(
                        () {
                          if (value == null) {
                            return;
                          }
                          _selectedSubject = value;
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: TextField(
                  maxLength: 100,
                  controller: _QuestionController,
                  decoration: InputDecoration(
                    hintText: "Enter Question",
                    hintStyle: const TextStyle(fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Options",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                controller: _Option1,
                decoration: InputDecoration(
                  hintText: "Option 1",
                  hintStyle: const TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                controller: _Option2,
                decoration: InputDecoration(
                  hintText: "Option 2",
                  hintStyle: const TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                controller: _Option3,
                decoration: InputDecoration(
                  hintText: "Option 3",
                  hintStyle: const TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                controller: _Option4,
                decoration: InputDecoration(
                  hintText: "Option 4",
                  hintStyle: const TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Select Answer",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton(
                    value: _selectedAnswer,
                    items: [
                      for (int i = 1; i < 5; i++)
                        DropdownMenuItem(
                          value: "Option $i",
                          child: Text("Option $i"),
                        ),
                    ],
                    onChanged: (value) {
                      setState(
                        () {
                          if (value == null) {
                            return;
                          }
                          _selectedAnswer = value;
                        },
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel"),
                      ),
                      ElevatedButton(
                        onPressed: _QuizSave,
                        child: const Text("Save Quiz"),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
