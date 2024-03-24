import 'package:flutter/material.dart';
import 'package:Quizbox/DummyData/Quizdata.dart';
import 'package:Quizbox/Models/QuestionsModels.dart';
import 'package:Quizbox/Screens/QuizAdder.dart';
import 'package:Quizbox/Screens/QuizScreen.dart';
import 'package:Quizbox/Screens/Setting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Quizbox/Widgets/SearchBar.dart';
import 'package:Quizbox/Widgets/drawer.dart';
import 'package:Quizbox/main.dart';

final List<Quiz> _quizList = [];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _openAddQuizOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewQuiz(
        quizSaver: _quizSaver,
      ),
    );
  }

  void _selectScreen(String Screens) {
    Navigator.of(context).pop();
    if (Screens == "Setting") {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const settingMods(),
        ),
      );
    }
  }

  void _quizScreenChanger(String questions) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => QuizScreen(
          quizId: questions,
        ),
      ),
    );
  }

  void _QuizRemover(Quiz Quiz) {
    int questionIndex = dummyQuestions.indexOf(Quiz);
    setState(() {
      dummyQuestions.removeAt(questionIndex);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      content: Text("Expense removed",
          style: TextStyle(color: Theme.of(context).colorScheme.onBackground)),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        textColor: Theme.of(context).colorScheme.onBackground,
        label: "Undo",
        onPressed: () {
          setState(() {
            dummyQuestions.insert(questionIndex, Quiz);
          });
        },
      ),
    ));
  }

  void _quizSaver(Quiz Quiz) {
    setState(() {
      dummyQuestions.add(Quiz);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: _openAddQuizOverlay,
              icon: const Icon(
                Icons.add,
                size: 28,
              ),
            ),
          )
        ],
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: DrawerHome(
        onSelectScreen: _selectScreen,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // search bar start
          // search bar end
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 30, 0, 15),
            child: Text(
              "Your Quizes",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          for (final Quiz in dummyQuestions)
            Card(
              child: InkWell(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Dismissible(
                      background: Container(
                        color: Colors.red.withOpacity(.6),
                      ),
                      onDismissed: (context) => _QuizRemover(Quiz),
                      key: ValueKey(Quiz.id),
                      child: ListTile(
                        onTap: () => _quizScreenChanger(
                          (Quiz.id).toString(),
                        ),
                        leading: Icon(subjectIcons[Quiz.subject]),
                        title: Text(Quiz.questions),
                        subtitle: Text(Quiz.subject.toString().substring(8)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
