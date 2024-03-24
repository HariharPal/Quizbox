import 'package:flutter/material.dart';
import 'package:Quizbox/Screens/Home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

final ThemeData _DarkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
  primaryColor: const Color.fromARGB(255, 21, 20, 29),
);

class ThemeProvider with ChangeNotifier {
  bool _darkMode = false;

  ThemeData get themeData => _darkMode ? _DarkTheme : ThemeData.light();

  bool get darkMode => _darkMode;

  void toggleTheme() {
    _darkMode = !_darkMode;

    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const HomePage(),
    );
  }
}
