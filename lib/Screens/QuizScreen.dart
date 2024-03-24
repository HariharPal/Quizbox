import 'package:flutter/material.dart';
import 'package:Quizbox/DummyData/Quizdata.dart';
import 'package:Quizbox/Models/QuestionsModels.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen({super.key, required this.quizId});
  String quizId;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  bool isButtonEnabled = true;
  String correctTile = "";

  List<Color> optionBgColors =
      List.filled(4, const Color.fromARGB(255, 81, 209, 213).withOpacity(.7));

  Quiz getQuizIdBy(String id) {
    Quiz? quiz = dummyQuestions.firstWhere((quiz) => quiz.id == id,
        orElse: () => Quiz(
              questions: "Quiz not found",
              options: [],
              subject: Subject.Maths,
              quizAnswer: 0,
            ));
    return quiz;
  }

  _selectedOption(
      String selectedAnswer, String correctAnswer, int optionIndex) {
    setState(() {
      if (selectedAnswer == correctAnswer) {
        optionBgColors[optionIndex] = Colors.green.withOpacity(.7);
        isButtonEnabled = false;
        correctTile = "Nice, Your answer is correct.";
      } else {
        optionBgColors[optionIndex] = Colors.red.withOpacity(.7);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Quiz Screen",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            (getQuizIdBy(widget.quizId)).questions,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (int i = 0;
                  i < getQuizIdBy(widget.quizId).options.length;
                  i++)
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: InkWell(
                    child: Card(
                      color: optionBgColors[i],
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      child: SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: isButtonEnabled
                              ? () {
                                  _selectedOption(
                                    getQuizIdBy(widget.quizId)
                                        .options
                                        .elementAt(i),
                                    getQuizIdBy(widget.quizId)
                                        .options
                                        .elementAt(getQuizIdBy(widget.quizId)
                                                .quizAnswer -
                                            1),
                                    i,
                                  );
                                }
                              : null,
                          child: Text(
                            getQuizIdBy(widget.quizId).options.elementAt(i),
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              Text(
                correctTile,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          )
        ],
      ),
    );
  }
}
