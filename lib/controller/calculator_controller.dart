import 'package:get/get.dart';

class CalculatorController extends GetxController{
  static CalculatorController get to => Get.find();
  String firstNum = "";
  String secondNum = "0";

  int operationNum = 0;
  bool numState = false;
  String operationString = "";
  String errorMsg = "";
  String resultBackString = "";
  String resultNum = "";
  String resultString = "";


  void num(String value){
    if(secondNum == "0" || numState){
      numState = false;
      secondNum = value;
    }
    else if(secondNum != "0"){
      secondNum = "$secondNum" "$value";
    }

    update();
  }
  void operation(String value){

    switch (value){
      case "plus":
        if(!numState){
          if(operationString == ""){
            firstNum = secondNum;
          }
          else if(operationString == "-"){
            firstNum = (double.parse(firstNum) - double.parse(secondNum)).toString();
          }
          else if(operationString == "*"){
            firstNum = (double.parse(firstNum) * double.parse(secondNum)).toString();
          }
          else if(operationString == "÷"){
            firstNum = (double.parse(firstNum) / double.parse(secondNum)).toString();
          }
          else{
            firstNum = (double.parse(firstNum) + double.parse(secondNum)).toString();
          }
        }
        operationString = "+";
        break;

      case "subtract":
        if(!numState){
          if(operationString == ""){
            firstNum = secondNum;
          }
          else if(operationString == "+"){
            firstNum = (double.parse(firstNum) + double.parse(secondNum)).toString();
          }
          else if(operationString == "*"){
            firstNum = (double.parse(firstNum) * double.parse(secondNum)).toString();
          }
          else if(operationString == "÷"){
            firstNum = (double.parse(firstNum) / double.parse(secondNum)).toString();
          }
          else{
            firstNum = (double.parse(firstNum) - double.parse(secondNum)).toString();
          }
        }
        operationString = "-";
        break;

      case "multiply":
        if(!numState){
          if(operationString == ""){
            firstNum = secondNum;
          }
          else if(operationString == "+"){
            firstNum = (double.parse(firstNum) + double.parse(secondNum)).toString();
          }
          else if(operationString == "-"){
            firstNum = (double.parse(firstNum) - double.parse(secondNum)).toString();
          }
          else if(operationString == "÷"){
            firstNum = (double.parse(firstNum) / double.parse(secondNum)).toString();
          }
          else{
            firstNum = (double.parse(firstNum) * double.parse(secondNum)).toString();
          }
        }
        operationString = "*";
        break;

      case "divide":
        if(!numState){
          if(operationString == ""){
            firstNum = secondNum;
          }
          else if(operationString == "+"){
            firstNum = (double.parse(firstNum) + double.parse(secondNum)).toString();
          }
          else if(operationString == "-"){
            firstNum = (double.parse(firstNum) - double.parse(secondNum)).toString();
          }
          else if(operationString == "*"){
            firstNum = (double.parse(firstNum) * double.parse(secondNum)).toString();
          }
          else if(firstNum != "0" && secondNum == "0"){
            firstNum = "";
            secondNum = "";
            operationString = "";
            errorMsg = "0으로 나눌 수 없습니다.";
          }
          else if(firstNum == "0" && secondNum == "0"){
            firstNum = "";
            secondNum = "";
            operationString = "";
            errorMsg = "정의되지 않은 결과입니다.";
          }
          else{
            firstNum = (double.parse(firstNum) / double.parse(secondNum)).toString();
            operationString = "÷";
          }
        }
        else{
          operationString = "÷";
        }

        break;
    }
    numState = true;
    update();
  }
  void result(){
    if(operationString == "+"){
      if(resultNum == ""){
        resultNum = secondNum;
        secondNum = (double.parse(firstNum) + double.parse(resultNum)).toString();
      }
      else{
        firstNum = secondNum;
        secondNum = (double.parse(firstNum) + double.parse(resultNum)).toString();
      }
    }

    if(operationString == "-"){
      if(resultNum == ""){
        resultNum = secondNum;
        secondNum = (double.parse(firstNum) - double.parse(resultNum)).toString();
      }
      else{
        firstNum = secondNum;
        secondNum = (double.parse(firstNum) - double.parse(resultNum)).toString();
      }
    }

    if(operationString == "*"){
      if(resultNum == ""){
        resultNum = secondNum;
        secondNum = (double.parse(firstNum) * double.parse(resultNum)).toString();
      }
      else{
        firstNum = secondNum;
        secondNum = (double.parse(firstNum) * double.parse(resultNum)).toString();
      }
    }

    if(operationString == "÷"){
      if(resultNum == ""){
        resultNum = secondNum;
        secondNum = (double.parse(firstNum) / double.parse(resultNum)).toString();
      }
      else{
        firstNum = secondNum;
        secondNum = (double.parse(firstNum) / double.parse(resultNum)).toString();
      }
    }

    resultBackString = "=";
    resultString = resultNum + resultBackString;
    update();
  }

  void CE(){
    secondNum = "0";
    update();
  }

  void C(){
    firstNum = "";
    secondNum = "0";
    resultBackString = "";
    resultNum = "";
    resultString = "";

    operationNum = 0;
    operationString = "";
    update();
  }
}