import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget{
   const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
    });

   final void Function() onRestart;
   final List<String> chosenAnswers;

   List<Map<String, Object>> get summaryData{
    final List<Map<String, Object>> summary = [];

    for(var i =0; i< chosenAnswers.length; i++){
      summary.add(
        {
          'questions_index' : i,
          'question' : questions[i].text,
          'correct_answer':questions[i].answers[0],
          'user_answer': chosenAnswers[i]
       },
       );
    }
    return summary;
   }

  @override
  Widget build(BuildContext context){
     final numTotalQuestion = questions.length;
     final numCorrectQuestions = summaryData
     .where(
      (data) => data['user_name'] == data['correct_answer'],
     )
     .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin:const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestion question correctly!',
              ),
           const SizedBox(
            height: 30,
            ),
           QuestionSummary(summaryData),
           const SizedBox(
            height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ), 
              icon: const Icon(Icons.refresh),
              label:const Text('Restart Quiz!'),
              )
          ],
        ),
      ),
    );
  }
}