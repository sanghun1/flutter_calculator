import 'package:calculator/controller/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CalculatorController _calculatorController = Get.put(CalculatorController());

  String num = "0";
  bool isDisable = false;

  @override
  Widget build(BuildContext context) {
    // dynamic size = MediaQuery.of(context).size;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xff202020),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: Get.height * 0.04, horizontal: Get.width * 0.01),
                        child: GetBuilder<CalculatorController>(
                          builder: (controller) {
                            return Text(
                              "${_calculatorController.xOperationString} ${_calculatorController.firstNum} ${_calculatorController.operationString} ${_calculatorController.resultString}",
                              style: TextStyle(fontSize: 20, color: Color(0xffA6A6A6)),
                            );
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(Get.width * 0.02, 0, Get.width * 0.02, Get.height * 0.06),
                        child: GetBuilder<CalculatorController>(
                          builder: (controller) {
                            return Text(
                              "${_calculatorController.secondNum}${_calculatorController.errorMsg}",
                              style: TextStyle(fontSize: 38, color: Colors.white),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: Get.width * 0.18, height: Get.height * 0.06),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _calculatorController.memoryClear();
                            });
                          },
                          style: ElevatedButton.styleFrom(primary: Color(0xff202020)),
                          child: Text("MC"),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: Get.width * 0.18, height: Get.height * 0.06),
                        child: ElevatedButton(
                          onPressed: _calculatorController.memoryDisable ? () => _calculatorController.memoryRead() : null,
                          style: ElevatedButton.styleFrom(primary: Color(0xff202020), onSurface: Color(0xff202020)),
                          child: Text("MR", style: TextStyle(color: _calculatorController.memoryDisable ? Colors.white : Color(0xff717171))),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: Get.width * 0.18, height: Get.height * 0.06),
                        child: ElevatedButton(
                          onPressed: _calculatorController.memoryDisable ? () => _calculatorController.memoryPlus() : null,
                          style: ElevatedButton.styleFrom(primary: Color(0xff202020), onSurface: Color(0xff202020)),
                          child: Text("M+", style: TextStyle(color: _calculatorController.memoryDisable ? Colors.white : Color(0xff717171))),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: Get.width * 0.18, height: Get.height * 0.06),
                        child: ElevatedButton(
                          onPressed: _calculatorController.memoryDisable ? () => _calculatorController.memoryMinus() : null,
                          style: ElevatedButton.styleFrom(primary: Color(0xff202020), onSurface: Color(0xff202020)),
                          child: Text("M-", style: TextStyle(color: _calculatorController.memoryDisable ? Colors.white : Color(0xff717171))),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: Get.width * 0.18, height: Get.height * 0.06),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _calculatorController.memorySave();
                            });
                          },
                          style: ElevatedButton.styleFrom(primary: Color(0xff202020)),
                          child: Text("MS"),
                        ),
                      ),
                    ],
                  ),
                  Table(
                    border: TableBorder.all(color: Color(0xff202020), width: 3),
                    children: [
                      TableRow(
                        // 1
                        children: <Widget>[
                          ConstrainedBox(
                            constraints: BoxConstraints.tightFor(height: Get.height * 0.11),
                            child: ElevatedButton(
                              onPressed: () {
                                _calculatorController.percentFunction();
                              },
                              style: ElevatedButton.styleFrom(primary: Color(0xff323232)),
                              child: Center(child: Text("%", style: TextStyle(fontSize: 30, color: Colors.white))),
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints.tightFor(height: Get.height * 0.11),
                            child: ElevatedButton(
                              onPressed: () {
                                _calculatorController.CE();
                              },
                              style: ElevatedButton.styleFrom(primary: Color(0xff323232)),
                              child: Center(child: Text("CE", style: TextStyle(fontSize: 30, color: Colors.white))),
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints.tightFor(height: Get.height * 0.11),
                            child: ElevatedButton(
                              onPressed: () {
                                _calculatorController.C();
                              },
                              style: ElevatedButton.styleFrom(primary: Color(0xff323232)),
                              child: Center(child: Text("C", style: TextStyle(fontSize: 30, color: Colors.white))),
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints.tightFor(height: Get.height * 0.11),
                            child: ElevatedButton(
                              onPressed: () {
                                _calculatorController.delete();
                              },
                              style: ElevatedButton.styleFrom(primary: Color(0xff323232)),
                              child: Center(child: Text("DEL", style: TextStyle(fontSize: 30, color: Colors.white))),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        // 2
                        children: <Widget>[
                          ConstrainedBox(
                            constraints: BoxConstraints.tightFor(height: Get.height * 0.11),
                            child: ElevatedButton(
                              onPressed: () {
                                _calculatorController.fraction();
                              },
                              style: ElevatedButton.styleFrom(primary: Color(0xff323232)),
                              child: Center(child: Text("1/X", style: TextStyle(fontSize: 30, color: Colors.white))),
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints.tightFor(height: Get.height * 0.11),
                            child: ElevatedButton(
                              onPressed: () {
                                _calculatorController.squared();
                              },
                              style: ElevatedButton.styleFrom(primary: Color(0xff323232)),
                              child: Center(child: Text("x²", style: TextStyle(fontSize: 30, color: Colors.white))),
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints.tightFor(height: Get.height * 0.11),
                            child: ElevatedButton(
                              onPressed: () {
                                _calculatorController.log();
                              },
                              style: ElevatedButton.styleFrom(primary: Color(0xff323232)),
                              child: Center(child: Text("²√x", style: TextStyle(fontSize: 30, color: Colors.white))),
                            ),
                          ),
                          operationConstrainBox("divide", "÷"),
                        ],
                      ),
                      TableRow(
                        // 3
                        children: <Widget>[
                          numConstrainBox("7"),
                          numConstrainBox("8"),
                          numConstrainBox("9"),
                          operationConstrainBox("multiply", "*"),
                        ],
                      ),
                      TableRow(
                        // 4
                        children: <Widget>[
                          numConstrainBox("4"),
                          numConstrainBox("5"),
                          numConstrainBox("6"),
                          operationConstrainBox("subtract", "-"),
                        ],
                      ),
                      TableRow(
                        // 5
                        children: <Widget>[
                          numConstrainBox("1"),
                          numConstrainBox("2"),
                          numConstrainBox("3"),
                          operationConstrainBox("plus", "+"),
                        ],
                      ),
                      TableRow(
                        // 6
                        children: <Widget>[
                          ConstrainedBox(
                            constraints: BoxConstraints.tightFor(height: Get.height * 0.11),
                            child: ElevatedButton(
                              onPressed: () {
                                _calculatorController.negative();
                              },
                              style: ElevatedButton.styleFrom(primary: Color(0xff3B3B3B)),
                              child: Center(child: Text("+/_", style: TextStyle(fontSize: 30, color: Colors.white))),
                            ),
                          ),
                          numConstrainBox("0"),
                          ConstrainedBox(
                            constraints: BoxConstraints.tightFor(height: Get.height * 0.11),
                            child: ElevatedButton(
                              onPressed: () {
                                _calculatorController.dot();
                              },
                              style: ElevatedButton.styleFrom(primary: Color(0xff3B3B3B)),
                              child: Center(child: Text(".", style: TextStyle(fontSize: 30, color: Colors.white))),
                            ),
                          ),
                          // exConstrainBox(_calculatorController.result(), "="),
                          ConstrainedBox(
                            constraints: BoxConstraints.tightFor(height: Get.height * 0.11),
                            child: ElevatedButton(
                              onPressed: () {
                                _calculatorController.result();
                              },
                              style: ElevatedButton.styleFrom(primary: Color(0xffA6A5A1)),
                              child: Center(child: Text("=", style: TextStyle(fontSize: 30, color: Color(0xff202020)))),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ))

            ],
          ),
        ),
      ),
    );
  }
//_calculatorController.result()
  Widget numConstrainBox(String number) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(height: Get.height * 0.11),
      child: ElevatedButton(
        onPressed: () {
          _calculatorController.num(number);
        },
        style: ElevatedButton.styleFrom(primary: Color(0xff3B3B3B)),
        child: Center(child: Text(number, style: TextStyle(fontSize: 30, color: Colors.white))),
      ),
    );
  }

  Widget operationConstrainBox(String operation, String symbol) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(height: Get.height * 0.11),
      child: ElevatedButton(
        onPressed: () {
          _calculatorController.operation(operation);
        },
        style: ElevatedButton.styleFrom(primary: Color(0xff323232)),
        child: Center(child: Text(symbol, style: TextStyle(fontSize: 30, color: Colors.white))),
      ),
    );
  }

  Widget exConstrainBox(void function, String symbol) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(height: 100),
      child: ElevatedButton(
        onPressed: () => function,
        style: ElevatedButton.styleFrom(primary: Color(0xff323232)),
        child: Center(child: Text(symbol, style: TextStyle(fontSize: 30, color: Colors.white))),
      ),
    );
  }
}
