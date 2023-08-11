import 'package:flutter/material.dart';
import 'package:quiz4/data/question1.dart';
import 'package:quiz4/questions_summary.dart';
 class ResultsScreen extends StatelessWidget
 {
   ResultsScreen({super.key,required this.chosenAnswer});

   final List<String>chosenAnswer;
   List<Map<String,Object>> getSummaryData()
   {
     final List<Map<String,Object>>summary=[];
     for (var i=0;i<chosenAnswer.length;i++)
       {
          summary.add({
            'question_index':i,
            'question':questions[i].text,
            'correct_answer':questions[i].answers[0],
            'user-answer':chosenAnswer[i],
          });
       }
     return summary;
   }
   @override
   Widget build(context)
   {
     final summaryData=getSummaryData();
     final numTotalQuestions=questions.length;
     final numCorrectQuestions=summaryData.where((data) {
       return data['user-answer']==data['correct_answer'];
     }).length;
     return SizedBox(
         width: double.infinity,
         child: Container(
         margin: EdgeInsets.all(40),
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
                  Text("You Answered $numCorrectQuestions out of $numTotalQuestions questions correctly!",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,

                  ),),
         SizedBox(height: 30,),
         QuestionsSummary(summaryData),
         SizedBox(height: 30,),
         TextButton(onPressed: () {},
             child: Text("Restart Quiz",
             style: TextStyle(
               color: Colors.black,
             ),),)
       ],
     )
         )
     );
   }
 }