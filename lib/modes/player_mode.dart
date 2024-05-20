
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/checkwinner.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> displayExOhio = ['', '', '', '', '', '', '', '', ''];

  int player1 = 0;
  int player2 = 0;

  String displayExOh = "x";
  void _tapped(int index) {
    setState(() {
      
      if (displayExOhio[index].isEmpty) {
        if (displayExOh == "x") {
          displayExOhio[index] = "o";
          displayExOh = "o";
        } else {
          displayExOhio[index] = "x";
          displayExOh = "x";
        }
      }

      var checkwinner = checkWinner(displayExOhio);
      if(checkwinner != null){
        showDialog(
          context: context, 
          builder: (context) => AlertDialog(
            title: Text("The winner is ${checkwinner == 'x'? 'player 2': 'player 1'}"),
          )
        );
        if(checkwinner == 'x'){
          ++player2;
        }
        else {
          ++player1;
        }
      }

      if(checkwinner == null && !displayExOhio.contains('')){
        showDialog(
          context: context, 
          builder: (context) => const AlertDialog(
            title: Text("Draw")
          ));
      }
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
             SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Player 1: o", style: TextStyle(color: Colors.white, fontFamily: 'joystix')),
                    Text("$player1", style: const TextStyle(color: Colors.white, fontFamily: 'joystix')),
                  ],
                ),
                const SizedBox(width: 50,),
                 Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Player 2: x", style: TextStyle(color: Colors.white, fontFamily: 'joystix'), ),
                    Text("$player2", style: const TextStyle(color: Colors.white, fontFamily: 'joystix')),

                  ],
                )
              ],
            )),
            const SizedBox(height: 40,),
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
                backgroundColor: MaterialStateProperty.all<Color>(Colors.grey[600]!),
              ),
              onPressed: (){
                setState(() {
                  displayExOhio = ['', '', '', '', '', '', '', '', ''];
                  displayExOh = "x";
                  
                });
              },
              child:  const Text("Restart", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30 )),),

            const SizedBox(height: 30),
            const Expanded(flex: 1,  child: Text("Tic - Tac - Toe", style: TextStyle(color: Colors.white, fontFamily: 'joystix', fontSize: 20)))
          ]
        ));
  }
}
