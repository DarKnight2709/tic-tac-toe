import 'package:flutter/material.dart';
import 'package:tic_tac_toe/checkwinner.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> displayExOhio = ['', '', '', '', '', '', '', '', ''];

  int aiPoint = 0;
  int yourPoint = 0;


  String displayExOh = 'o';
  void _tapped(int index) {
    setState(() {
      if (displayExOhio[index] == '' && displayExOh == 'o') {
        displayExOhio[index] = 'o';
        displayExOh = 'x';
      }

      var checkwinner = checkWinner(displayExOhio);
      if (checkwinner != null) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                      "The winner is ${checkwinner == 'x' ? 'AI' : 'You'}"),
                ));
        if (checkwinner == 'x') {
          ++aiPoint;
        } else {
          ++yourPoint;
        }
      }

      if (checkwinner == null && !displayExOhio.contains('')) {
        showDialog(
            context: context,
            builder: (context) => const AlertDialog(title: Text("Draw")));
      }


      int bestmove = 0;
      int maxVal = -2;
      for (int i = 0; i < displayExOhio.length; i++) {
        if (displayExOhio[i] == '') {
          displayExOhio[i] = 'x';
          int eval1 = miniMax(false);
          displayExOhio[i] = '';
          if(eval1 > maxVal){
            maxVal = eval1;
            bestmove = i;
          }
        }
      }
      if(displayExOhio[bestmove] == '' && displayExOh == 'x'){
        displayExOhio[bestmove] = 'x';
        displayExOh = 'o';
      }
      

      var checkwinner2 = checkWinner(displayExOhio);
      if (checkwinner2 != null) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                      "The winner is ${checkwinner2 == 'x' ? 'AI' : 'You'}"),
                ));
        if (checkwinner2 == 'x') {
          ++aiPoint;
        } else {
          ++yourPoint;
        }
      }
    });
  }

  int miniMax(bool maximizingPlayer) {
    var check = checkWinner(displayExOhio);

    if (check == 'x') return 1;

    if (check == 'o') return -1;
    

    if (check == null && !displayExOhio.contains('')) return 0;

    if (maximizingPlayer) {
      int maxVal = -2;
      for (int i = 0; i < displayExOhio.length; i++) {
        if (displayExOhio[i] == '') {
          displayExOhio[i] = 'x';
          int eval1 = miniMax(false);
          displayExOhio[i] = '';
          maxVal = max(eval1, maxVal);
        }
      }
      return maxVal;
    }
    else{
      int minVal = 2;
      for (int i = 0; i < displayExOhio.length; i++) {
        if (displayExOhio[i] == '') {
          displayExOhio[i] = 'o';
          int eval2 = miniMax(true);
          displayExOhio[i] = '';
          minVal = min(eval2, minVal);
        }
      }
      return minVal;
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(height: 30),
          SafeArea(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("You: o",
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'joystix')),
                  Text("$yourPoint",
                      style: const TextStyle(
                          color: Colors.white, fontFamily: 'joystix')),
                ],
              ),
              const SizedBox(
                width: 80,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "AI: x",
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'joystix'),
                  ),
                  Text("$aiPoint",
                      style: const TextStyle(
                          color: Colors.white, fontFamily: 'joystix')),
                ],
              )
            ],
          )),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _tapped(index),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[700]!),
                      ),
                      child: Center(
                          child: Text(displayExOhio[index],
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 40))),
                    ),
                  );
                }),
          ),
          const SizedBox(height: 30),
          TextButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.grey[600]!),
            ),
            onPressed: () {
              setState(() {
                displayExOhio = ['', '', '', '', '', '', '', '', ''];
                displayExOh = 'o';
              });
            },
            child: const Text("Restart",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 30)),
          ),
          const SizedBox(height: 30),
          const Expanded(
              flex: 1,
              child: Text("Tic - Tac - Toe",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'joystix',
                      fontSize: 20)))
        ]));
  }
}
