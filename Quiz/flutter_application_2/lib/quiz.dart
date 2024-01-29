import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/questions.dart';
import 'package:flutter_application_2/home.dart';
import 'package:flutter_application_2/questionsPage.dart';
import 'package:flutter_application_2/result.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? activeScreen;

  void chooseAnswer(String answer) {
    // log(answer);
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = Result(selectedAnswers, restart);
      });
    }
    log(selectedAnswers.toString());
  }

  void restart() {
    setState(() {
      selectedAnswers = [];
      activeScreen = Home(switchScreen);
    });
  }

  @override
  void initState() {
    super.initState();
    activeScreen = Home(switchScreen);
  }

  void switchScreen() {
    setState(() {
      activeScreen = Questions(chooseAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.deepPurpleAccent,
            Colors.purpleAccent,
          ])),
          child: activeScreen,
        ),
      ),
    );
  }
}
