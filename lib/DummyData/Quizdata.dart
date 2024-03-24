import 'package:Quizbox/Models/QuestionsModels.dart';

final dummyQuestions = [
  Quiz(
    subject: Subject.Maths,
    questions: "What is 5 + 9?",
    options: [
      "14",
      "19",
      "15",
      "18",
    ],
    quizAnswer: 1,
  ),
  Quiz(
    subject: Subject.Chemistry,
    questions: "Which one of the option is correct for atom ?",
    options: [
      "Smallest particle",
      "Discoverd by Neils Bohr",
      "Zero net charge every time",
      "Many electron Bond are called Molecules ",
    ],
    quizAnswer: 4,
  ),
  Quiz(
    subject: Subject.Geography,
    questions: "How many Continents are there?",
    options: [
      "5",
      "7",
      "8",
      "6",
    ],
    quizAnswer: 2,
  )
];
