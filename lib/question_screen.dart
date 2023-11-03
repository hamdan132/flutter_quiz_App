import 'package:flutter/material.dart';
import 'package:quiz_flutter/data/Question.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:quiz_flutter/models/quiz_question.dart';

class Question extends StatefulWidget {
  const Question({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<Question> createState() => _QuestionState();
}

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerText, this.onTap, {super.key});

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 2),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 40, 1, 95),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        ),
        child: Text(answerText, textAlign: TextAlign.center),
      ),
    );
  }
}

class _QuestionState extends State<Question> {
  var currentQuestionIndex = 0;

  void answerQuestion( String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    // currentQuestionIndex = currentQuestionIndex + 1;
    // currentQuestionIndex += 1;
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = question_page[currentQuestionIndex];

    return Container(
      margin: const EdgeInsets.all(40),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            textAlign: TextAlign.center,
            currentQuestion.text,
            style: GoogleFonts.lato(
              color:const Color.fromARGB(255, 216, 213, 255),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          ...currentQuestion.getShuffledAnswers().map((answer) {
            return AnswerButton(answer, (){
              answerQuestion(answer);
            });
          }),

          // AnswerButton(currentQuestion.answer[0], () { }),
          // AnswerButton(currentQuestion.answer[1], () { }),
          // AnswerButton(currentQuestion.answer[2], () { }),
          // AnswerButton(currentQuestion.answer[3], () { }),
        ],
      )),
    );
  }
}
