import 'package:flutter/material.dart';
import 'package:quiz4/answer_button.dart';
import 'package:quiz4/data/question1.dart';
import 'package:google_fonts/google_fonts.dart';
class Questions extends StatefulWidget{
  Questions({super.key,required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;
  @override
  State<Questions> createState() {
    // TODO: implement createState
    return _QuestionsState();
  }
}

class _QuestionsState extends State<Questions>{
  var currentQuestionIndex=0;
  void answerQuestion(String selectedAnswer)
  {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex+=1;
    });
  }
  @override
  Widget build(context)
  {
    final currentQuestion=questions[currentQuestionIndex];
    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,),
              SizedBox(height: 30,),
             ...currentQuestion.getShuffledAnswers().map((answer) {
               return AnswerButton(answerText: answer, onTap: (){
                 answerQuestion(answer);
               });
             })

            ],
          ),
        ),
      );
    ;
  }
}