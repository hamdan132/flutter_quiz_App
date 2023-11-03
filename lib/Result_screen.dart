import 'package:flutter/material.dart';
import 'package:quiz_flutter/data/Question.dart';
import 'package:flutter/cupertino.dart';
import 'package:quiz_flutter/quiz.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswer});


  final List<String> chosenAnswer;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': question_page[i].text,
          'correct_answer': question_page[i].answer[0],
          'user_answer': chosenAnswer[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = question_page.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    

    return Container(
      margin: const EdgeInsets.all(40),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Results',
              style: TextStyle(
                  fontSize: 30, color: Color.fromARGB(255, 255, 255, 255)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions Question Correctly!',
              style: const TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 255, 255, 255)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 20,
            ),
            TextButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(0, 255, 255, 255),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => const Quiz()),
                );
              },
              icon: const Icon(Icons.restart_alt),
              label: const Text('Restart Quiz',
                  style: TextStyle(
                      fontSize: 16, color: Color.fromARGB(255, 255, 255, 255))),
            )
          ],
        ),
      ),
    );
  }
}



class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final winColor = const Color.fromARGB(255,192,175,255,);
  final loseColor = const Color.fromARGB(255, 255, 148, 148);

  final List<Map<String, Object>> summaryData;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: data['user_answer'] == data['correct_answer'] ? winColor : loseColor,
                child: Text(
                  ((data['question_index'] as int) + 1).toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          data['question'] as String,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 15),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          data['user_answer'] as String,
                          style: TextStyle(
                            color: loseColor
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          data['correct_answer'] as String,
                          style: TextStyle(
                            color: winColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
