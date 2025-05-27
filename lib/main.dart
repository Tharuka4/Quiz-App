
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:adv_basics/quiz.dart';
import 'package:google_fonts/google_fonts.dart';

// void main(){
//   runApp(const Quiz());
// }
final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(
     App(),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const Quiz(),
    );
  }
}