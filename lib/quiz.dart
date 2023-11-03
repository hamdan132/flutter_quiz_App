// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:quiz_flutter/question_screen.dart';
import 'package:quiz_flutter/start_screen.dart';
import 'package:quiz_flutter/Result_screen.dart';
import 'package:quiz_flutter/data/Question.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question';
    });
  }

  void choosedAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == question_page.length){
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question') {
      screenWidget = Question(onSelectAnswer: choosedAnswer,);
    } 
    if (activeScreen == 'result-screen') {
      screenWidget =  ResultsScreen(chosenAnswer: selectedAnswer,);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 168)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
