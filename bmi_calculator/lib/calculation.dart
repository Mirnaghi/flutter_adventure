import 'dart:html';
import 'dart:math';

class Calculate{
  

  Calculate({this.weight, this.height});
  int weight;
  int height;

  double bmi;

  double calculateBMI(){
    bmi = height / pow(weight / 100, 2);
    return bmi;
  }

  String textResult(){
    if (bmi >= 25)
    {
      return "OVERWEIGHT";
    }
    else if(bmi > 18.5 && bmi < 25.0)
    {
      return "NORMAL";
    }
    else
    {
      return "UNNORMAL";
    }
  }

  String textDescription(){
    if (bmi >= 25)
    {
      return "Your BMI rate is high and it means you are getting owerweight. So keep exercising." ;
    }
    else if(bmi > 18.5 && bmi < 25.0)
    {
      return "Your BMI rate is normal but we recommend not to give up exercising.";
    }
    else 
    {
      return "Your BMI rate is under the normal rate. So consult doctor or increase your meal.";
    }
  }
}