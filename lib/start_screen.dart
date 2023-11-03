import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
// import 'package:quiz_flutter/question_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startquiz, {super.key});

  final void Function() startquiz;

  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/img/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(150, 255, 255, 255),
        ),
        const SizedBox(
          height: 50,
        ),
        Text(
          "Learn Flutter the fun way!",
          style:  GoogleFonts.lato(fontSize: 22, color: Colors.white),
        ),
        const SizedBox(
          height: 50,
        ),
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          ),
          onPressed: startquiz,
          
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text(
            'Start Quiz',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ],
    ));
  }
}
