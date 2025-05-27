import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:flutter/material.dart';

import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/questions_screen.dart';


class Quiz extends StatefulWidget{
  const Quiz({startQuiz, super.key});

  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}

class _QuizState extends State <Quiz>{
 List<String> selectedAnswers = [];
  var activeScreen = 'start screen';

  void switchScreen(){
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = 'results - screen';
      });
    }
  }

  void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      activeScreen = 'question_screen';
    });
  }

  @override
  Widget build (context){
    Widget screenWidget = StartScreen(switchScreen); 

    if (activeScreen == 'question-screen'){
      screenWidget =  QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'result screen'){
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers, 
        onRestart: restartQuiz,
        );
    }

    return  MaterialApp(
      home: Scaffold(
        body:Container(
          decoration:const BoxDecoration(
            gradient: LinearGradient(
            colors:[
                Color.fromARGB(255, 23, 2, 60),
            Color.fromARGB(255, 92, 28, 204),
            ],
             begin: Alignment.topLeft,
             end:Alignment.bottomRight,
          ),
          ),
          child: screenWidget,
          ),
      ),
    );
  }
}