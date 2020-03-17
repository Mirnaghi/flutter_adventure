import 'package:rflutter_alert/rflutter_alert.dart';

import 'words.dart';

class WordList{

  int _wordOrder = 0;

  List<Word> _wordList = [
    Word(a: 'der', w: 'Ratschlag'),
    Word(a: 'die', w: 'Freude'),
    Word(a: 'das', w: 'Gefuhl'),
    Word(a: 'die', w: 'Vermutung'),
    Word(a: 'das', w: 'Reichtum'),
  ];

  void changeWord(){
    if(_wordOrder < _wordList.length - 1){
      _wordOrder++;
    }
    else{
      //_wordOrder = _wordList.length -1;
      Alert(context: null ,title: "RFLUTTER", desc: "Flutter is awesome.").show();
    }
  }

  String getWord(){
    return _wordList[_wordOrder].word;
  }

  String getArtikel(){
    return _wordList[_wordOrder].artikel;
  }

  void setWordOrderToZero(){
    _wordOrder = 0;
  }
}