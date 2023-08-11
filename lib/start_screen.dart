import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget
{
  StartScreen(this.startQuiz,{super.key});
  final void Function() startQuiz;
  @override
  Widget build(context)
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          color: Colors.white,),

        SizedBox(height: 40,),
        Text("Learn Flutter the fun way",
          style: TextStyle(
            fontSize: 28,
            color: Colors.white,
          ),),
        SizedBox(height: 40,),
        ElevatedButton.icon(
            onPressed: startQuiz,
            icon: Icon(
              Icons.arrow_forward_sharp,
            ),
            label: Text("Start Quiz"))],
    );
  }
}