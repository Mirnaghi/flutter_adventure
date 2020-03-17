import 'package:bmi_calculator/widgets/icon_content.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'calculation.dart';
import 'result_page.dart';
import 'constans.dart';

enum GenderType {
  female,
  male,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender;
  Color maleCardColor = Color(0xFF494F43);
  Color femaleCardColor = Color(0xFF494F43);
  int height = 120;
  int weight = 60;
  int age = 18;

  void increaseWeight() {
    setState(() {
      weight++;
    });
  }

  void decreaseWeight() {
    setState(() {
      weight--;
    });
  }

  @override
  Widget build(BuildContext context) {
    Calculate bmiCalc = Calculate(weight: weight, height: height);
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI calculator'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.male;
                      });
                    },
                    colour: selectedGender == GenderType.male
                        ? kActiveColor
                        : kInactiveColor,
                    cardChild:
                        IconContent(icon: FontAwesomeIcons.mars, text: "MALE"),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.female;
                      });
                    },
                    colour: selectedGender == GenderType.female
                        ? kActiveColor
                        : kInactiveColor,
                    cardChild: IconContent(
                        icon: FontAwesomeIcons.venus, text: "FEMALE"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kInactiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "HEIGHT",
                    style: kTextStyle,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumberStyle,
                        ),
                        Text(
                          "cm",
                          style: kTextStyle,
                        )
                      ]),
                  Slider(
                    value: height.toDouble(),
                    activeColor: Color(0xFF5ACF6D),
                    inactiveColor: Color(0xFF51E19F),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: kInactiveColor,
                  cardChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "WEIGHT",
                          style: kTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedIconButton(
                              child: FontAwesomeIcons.plus,
                              onPressed: increaseWeight,
                            ),
                            SizedBox(width: 10.0),
                            RoundedIconButton(
                              child: FontAwesomeIcons.minus,
                              onPressed: decreaseWeight,
                            )
                          ],
                        ),
                      ]),
                ),
              ),
              Expanded(
                child: ReusableCard(
                    colour: kInactiveColor,
                    cardChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "AGE",
                          style: kTextStyle,
                        ),
                        Text(age.toString(), style: kNumberStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedIconButton(
                                child: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                            SizedBox(width: 10.0),
                            RoundedIconButton(
                                child: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                })
                          ],
                        )
                      ],
                    )),
              ),
            ]),
          ),
          Container(
              margin: EdgeInsets.only(
                top: 10.0,
              ),
              height: kBottomButtonHeight,
              child: RaisedButton(
                color: Color(0xFF51E19F),
                onPressed: () {
                  Calculate bmiCalc = Calculate(weight: weight, height: height);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                                bmiRate: bmiCalc.calculateBMI(),
                                result: bmiCalc.textResult(),
                                description: bmiCalc.textDescription(),
                              )));
                },
                child: Center(
                  child: Text(
                    "CALCULATE",
                    style: kBottomButtonText,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

// Increase and decrease buttons
class RoundedIconButton extends StatefulWidget {
  RoundedIconButton({@required this.child, @required this.onPressed});
  final IconData child;
  final Function onPressed;

  @override
  _RoundedIconButtonState createState() => _RoundedIconButtonState();
}

class _RoundedIconButtonState extends State<RoundedIconButton> {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      onPressed: widget.onPressed,
      elevation: 6.0,
      constraints: BoxConstraints(minHeight: 55.0, minWidth: 55.0),
      fillColor: kButtonColor,
      child: Icon(widget.child),
    );
  }
}
