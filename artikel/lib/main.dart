import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'wordList.dart';

void main() {
  runApp(
    MaterialApp(
        home: SafeArea(
            child: Scaffold(
      backgroundColor: Colors.white,
      body: ArtikelApp(),
    ))),
  );
}

class ArtikelApp extends StatefulWidget {
  @override
  _ArtikelAppState createState() => _ArtikelAppState();
}

class _ArtikelAppState extends State<ArtikelApp> {

  WordList wordsAndArtikels = WordList();

  List<Widget> answerCheck = [
    
  ];

  void answerChecker(correctAnswer, providedAnswer){
    if (correctAnswer == providedAnswer){
      answerCheck.add(Icon(Icons.check, color: Colors.green, size: 35.0));
    }else{
      answerCheck.add(Icon(Icons.close, color: Colors.red, size: 35.0));
    }

  }


  void rePlay(){
    answerCheck.clear();
    wordsAndArtikels.setWordOrderToZero();
    
  }

void endGame(){
  if(answerCheck.length == 5){   Alert(
      context: context,
      type: AlertType.error,
      title: "GAME OVER",
      desc: "press button to play again.",
      buttons: [
        DialogButton(
          child: Text(
            "Play",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => rePlay(),
          width: 120,
        )
      ],
    ).show();}
}
  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 15,
          child: Padding(
            padding: EdgeInsets.only(top: 150.0),
            child: Text(
              wordsAndArtikels.getWord(),
              style: TextStyle(fontSize: 80.0),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: RaisedButton(
              color: Colors.green,
              onPressed: () {
                var correctAnswer = wordsAndArtikels.getArtikel();

                setState(() {
                  answerChecker(correctAnswer, 'der');
                  
                  wordsAndArtikels.changeWord();    
                  endGame();
                });
              },
              child: Text("DER",
                  style: TextStyle(color: Colors.white, fontSize: 50.0))),
        ),
        Expanded(
          flex: 5,
          child: RaisedButton(
              color: Colors.red,
              onPressed: () {
                var correctAnswer = wordsAndArtikels.getArtikel();
                setState(() {
                  answerChecker(correctAnswer, 'die');
                wordsAndArtikels.changeWord(); 
                endGame();
              });},
              child: Text("DIE",
                  style: TextStyle(color: Colors.white, fontSize: 50.0))),
        ),
        Expanded(
          flex: 5,
          child: RaisedButton(
              color: Colors.orange[800],
              onPressed: () {
                var correctAnswer = wordsAndArtikels.getArtikel();
                setState(() {
                  answerChecker(correctAnswer, 'das');
                wordsAndArtikels.changeWord();
                endGame();
              });
              },
              child: Text("DAS",
                  style: TextStyle(color: Colors.white, fontSize: 50.0))),
        ),
        Row(
          children: answerCheck,
        )
      ],
    );
  }
}
