import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
    body: XylophoneApp(),
  )));
}

class XylophoneApp extends StatelessWidget {

  void playsound(int noteNum){
    final player = AudioCache();
    player.play('note$noteNum.wav');
  }

  dynamic createButton(int buttonNum,buttonColor){
    return Expanded(child: RaisedButton(
          color: buttonColor,
          onPressed: () {
            playsound(buttonNum);
          },
        ),);
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
       
        createButton(1, Colors.green), 

        createButton(2, Colors.purple),

        createButton(3, Colors.orange),

        createButton(4, Colors.pink),

        createButton(5, Colors.red),

        createButton(6, Colors.blue),
       
        createButton(7, Colors.yellow),

      ],
    ));
  }
}
