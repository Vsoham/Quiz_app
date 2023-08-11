import 'package:flutter/material.dart';
import 'package:quiz4/data/question1.dart';
import 'package:quiz4/questions.dart';
import 'package:quiz4/start_screen.dart';
import 'package:quiz4/results_screen.dart';
class Quiz extends StatefulWidget
{
  Quiz({super.key});
  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}
class _QuizState extends State<Quiz>
{
  List<String> selectedAnswers=[];
  var activeScreen="start-screen";
  @override
  // void initState() {
  //   activeScreen=StartScreen(SwitchScreen);
  //   super.initState();
  // }
  void SwitchScreen()
  {
    setState(() {
      activeScreen="question-screen";
    });
  }
  void chooseAnswer(String answers)
  {
    selectedAnswers.add(answers);
    if(selectedAnswers.length==questions.length)
      setState(() {
        activeScreen='results-screen';
      });
  }
  @override
  Widget build(context){
    Widget screenWidget= StartScreen(SwitchScreen);
    if(activeScreen=="question-screen")
      {
        screenWidget=Questions(onSelectAnswer: chooseAnswer);
      }
    if(activeScreen=="results-screen")
    {
      screenWidget=ResultsScreen(chosenAnswer: selectedAnswers,);
    }
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.blueAccent,
          body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent,
                    Colors.blue,
                    Colors.lightBlue,
                    Colors.lightBlueAccent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: screenWidget,
          )
      ),
    );
  }
}