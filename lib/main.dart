
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/modes/ai_mode.dart';
import 'package:tic_tac_toe/modes/player_mode.dart';
import 'package:tic_tac_toe/pages/modeselection.dart';
import 'package:tic_tac_toe/pages/startpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/startpage':(context) =>  const StartPage(),
        '/mode/ai': (context) => const AIPage(),
        '/mode/player': (context) => const PlayerPage(),
        '/modeSelection': (context) => const ModeSelectionPage()
      },
      home:  const StartPage()
    );
  }
}





