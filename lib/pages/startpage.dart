import 'package:flutter/material.dart';
import 'package:tic_tac_toe/mode.dart';

class StartPage extends StatelessWidget {
   const StartPage({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: const {},
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.black,
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    child: const Text("Tic-Tac-Toe",
                        style: TextStyle(
                            fontFamily: 'joystix',
                            color: Colors.white,
                            fontSize: 30))),
                Image.asset('assets/xoicon.png'),
                Column(
                  children: [
                    TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                        ),
                        onPressed: () => Navigator.pushNamed(context, Mode.modeGame == ModeGame.ai ? '/mode/ai': '/mode/player'),
                        child: 
                            const Text(
                              "Start", style: TextStyle(color: Colors.black, fontFamily: 'joystix', fontSize: 25)
                            ),
                          
                    ),
                    const SizedBox(height: 10,),
                    TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                        ),
                        onPressed: () => Navigator.pushNamed(context, '/modeSelection'),
                        child: 
                            const Padding(

                              padding: EdgeInsets.only(left: 9, right: 9),
                              child: Text(
                                "Mode", style: TextStyle(color: Colors.black, fontFamily: 'joystix', fontSize: 25)
                              ),
                            ),
                          
                    ),
                  ],
                ),
                const Text("@CREATEBYQUYEN",
                    style: TextStyle(fontFamily: 'joystix'))
              ],
            ))));
  }
}
