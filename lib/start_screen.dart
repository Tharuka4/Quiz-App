

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget{
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context){
    return  Center(
      child: Column(
       mainAxisSize:  MainAxisSize.min,
        children: [ 
           Image.asset(
            'assets/images/qus.png', 
          width:300 ,
 // color: Color.fromARGB(30, 153, 21, 21), // Change the alpha value to adjust transparency
          
          ),
      
          const SizedBox(height: 80),
           Text(
            'Learn flutter the fun way!',
             style: GoogleFonts.lato(
              color:  const Color.fromARGB(79, 222, 115, 115),
              fontSize: 24,
          ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz, 
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
          label:const Text('Start Quiz'), 
          ),
      ],
      ),
      );
  }
}