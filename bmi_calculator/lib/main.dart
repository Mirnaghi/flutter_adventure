import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMIcalculator());
 
class BMIcalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/resultPage': (context) => ResultPage(),
      },
      
    theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Color(0xFF080808),
      primaryColor: Color(0xFF080808),
      accentColor: Color(0xFF5ACF6D),
    ),
    );
  }
}


