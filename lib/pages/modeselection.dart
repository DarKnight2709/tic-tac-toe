import 'package:flutter/material.dart';
import 'package:tic_tac_toe/mode.dart';

class ModeSelectionPage extends StatelessWidget {
  const ModeSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
              onPressed: () {Navigator.pushNamed(context, '/startpage'); Mode.modeGame = ModeGame.player;},
              child: const Text("Player",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'joystix',
                      fontSize: 25)),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
              onPressed: () {Navigator.pushNamed(context, '/startpage'); Mode.modeGame = ModeGame.ai;},
              child: const Padding(
                padding: EdgeInsets.only(left: 9, right: 9),
                child: Text("AI",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'joystix',
                        fontSize: 25)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
