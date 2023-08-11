import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget
{
  QuestionsSummary(this.summaryData,{super.key});
  final List<Map<String,Object>> summaryData;
  @override
  Widget build(context)
  {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(children: summaryData.map((data){
          return Row(
            children: [
              Stack(children: [
                Icon(Icons.circle,
                  color: Colors.white,
                size: 25,),
                Text(((data['question_index'] as int)+1).toString(),),

              ],),
              // Text(((data['question_index'] as int)+1).toString(),),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text((data['question']) as String,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),),
                  Text((data['user-answer']) as String,
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 15,
                  ),),
                  Text((data['correct_answer']) as String,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),),
                ],),
              ),
            ],
          );
        }).toList()
          ,),
      ),
    );
  }
}