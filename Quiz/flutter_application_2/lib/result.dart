import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/questions.dart';
import 'package:flutter_application_2/summary.dart';

class Result extends StatelessWidget {
  const Result(
    this.selectedAnswers,
    this.restart, {
    super.key,
  });

  final List<String> selectedAnswers;
  final void Function() restart;

  List<Map<String, Object>> get SummaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    int numOfCorrectAnswer = SummaryData.where(
            (element) => element['user_answer'] == element['correct_answer'])
        .length;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'You answered $numOfCorrectAnswer out of ${questions.length} questions correctly!',
            style: const TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Summary(SummaryData),
          const SizedBox(height: 30),
          TextButton.icon(
            onPressed: restart,
            icon: const Icon(
              Icons.restart_alt_outlined,
              color: Color.fromARGB(255, 227, 192, 227),
            ),
            label: const Text(
              'Restart the Quiz!',
              style: TextStyle(
                color: Color.fromARGB(255, 227, 192, 227),
              ),
            ),
          )
        ],
      ),
    );
  }
}
