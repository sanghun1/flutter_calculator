import 'dart:math';

import 'package:get/get.dart';

class CalculatorController extends GetxController{
  static CalculatorController get to => Get.find();
  String firstNum = "";
  String secondNum = "0";

  int operationNum = 0;
  int numLength = 0;
  bool numState = false;
  bool memoryDisable = false;
  String xOperationString = "";
  String operationString = "";
  String errorMsg = "";
  String resultBackString = "";
  String resultNum = "";
  String resultString = "";
  String memoryNum = "";
  String memoryConvertNum = "";

  void memorySave(){
    if(memoryNum == ""){
      memoryDisable = true;
    }
    memoryNum = secondNum;
    memoryConvertNum = memoryNum;
    update();
  }

  memoryRead(){
    secondNum = memoryNum;
    update();
  }

  memoryClear(){
    memoryDisable = false;
    memoryNum = "";
    memoryConvertNum = "";
    update();
  }
  memoryPlus(){
    memoryNum = (double.parse(memoryNum) + double.parse(memoryConvertNum)).toString();
    update();
  }

  memoryMinus(){
    memoryNum = (double.parse(memoryNum) - double.parse(memoryConvertNum)).toString();
    update();
  }

  void num(String value){
    if(secondNum.contains(".")){
      numLength = secondNum.length - 1;
    }
    else{
      numLength = secondNum.length;
    }

    if(secondNum == "0" || numState && numLength < 16){
      numState = false;
      secondNum = value;
    }
    else if(secondNum != "0" && numLength < 16){
      secondNum = "$secondNum" "$value";
    }
    else if(numLength >= 16){
      secondNum = secondNum;
    }
    update();
  }
  void dot(){
    if(secondNum.contains(".")){
      secondNum = secondNum;
    }
    else{
      secondNum = "$secondNum" ".";
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
    resultString = "$resultNum $resultBackString";
    print("됨?");
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

    // operationNum = 0;
    xOperationString = "";
    operationString = "";
    update();
  }

  void delete(){
    if(double.parse(secondNum) >= 10){
      secondNum = ((int.parse(secondNum) / 10).floor()).toString();
    }
    else if(double.parse(secondNum) <= 9){
      secondNum = "0";
    }
    update();
  }

  void log(){
    xOperationString = "√($xOperationString";
    operationString = ")$operationString";

    if(firstNum == ""){
      firstNum = secondNum;
    }
    secondNum = (sqrt(double.parse(secondNum))).toStringAsPrecision(16);
    update();
  }

  void fraction(){
    xOperationString = "1/($xOperationString";
    operationString = ")$operationString";

    if(firstNum == ""){
      firstNum = secondNum;
    }
    secondNum = (1 / double.parse(secondNum)).toStringAsPrecision(16);
    update();
  }

  void squared(){
    xOperationString = "sqr($xOperationString";
    operationString = ")$operationString";

    if(firstNum == ""){
      firstNum = secondNum;
    }
    secondNum = (double.parse(secondNum) * double.parse(secondNum)).toString();
    update();
  }

  void negative(){
    secondNum = (double.parse(secondNum) * (-1)).toString();
    update();
  }

  void percentFunction(){
    if(!(operationString == "+" || operationString == "-" || operationString == "*" || operationString == "÷")){
      firstNum = "0";
      secondNum = "0";

      xOperationString = "";
      operationString = "";

      resultNum = "";
      resultString = "";
    }
    else{
      resultString = (double.parse(firstNum) * (double.parse(firstNum) / 100)).toString();
      secondNum = resultString;
    }
    update();
  }

  void count(){
    secondNum = "555";
    if(secondNum.contains(".")){
      firstNum = "true";
    }
    else{
      firstNum = "false";
    }
    update();
  }
}