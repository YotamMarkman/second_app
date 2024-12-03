import 'package:flutter/material.dart';
import 'package:second_app/home_page.dart';
import 'package:second_app/questions_screen.dart';
import 'package:second_app/data/questions.dart';
import 'package:second_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'home_page';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions_screen';
    });
  }

  void selectedAnswersHandler(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results_screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = HomePage(switchScreen); // Default to HomePage
    if (activeScreen == 'questions_screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: selectedAnswersHandler);
    }

    if (activeScreen == 'results_screen') {
      screenWidget =
          ResultsScreen(choosenAnswers: selectedAnswers, switchScreen);
      selectedAnswers = [];
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(194, 155, 39, 176),
                Color.fromARGB(255, 77, 5, 89)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget, // Use screenWidget here
        ),
      ),
    );
  }
}
