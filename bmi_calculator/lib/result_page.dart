import 'package:bmi_calculator/constans.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';

import 'input_page.dart';

class ResultPage extends StatelessWidget {
  
  final String result;
  final double bmiRate;
  final String description;

  ResultPage({@required this.result, @required this.bmiRate, @required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your result"),
        centerTitle: true,
      ),
      
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(child:ReusableCard(
              colour: kActiveColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  
                  Text(result, style: kConditionTextNormal),
                  Text(bmiRate.toString(), style: kResultNumber),
                  Text(
                      description,
                      style: TextStyle(color: Color(0xFFECE4E3), fontSize: 20.0,),
                      textAlign: TextAlign.center,),
                ],
              ),
            ),),

            Container(
              
              margin: EdgeInsets.only(
                top: 10.0,
              ),
              height: kBottomButtonHeight,
              child: RaisedButton(
                color: Color(0xFF51E19F),
                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => InputPage()));},
                child: Center(
                  child: Text(
                    "RE-CALCULATE",
                    style: kBottomButtonText,
                  ),
                ),
              ),),
          ],
        ),
      
    );
  }
}
