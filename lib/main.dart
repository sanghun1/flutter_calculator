import 'package:calculator/controller/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CalculatorController _calculatorController = Get.put(CalculatorController());
  String num = "0";

  @override
  Widget build(BuildContext context) {
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
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: GetBuilder<CalculatorController>(
                          builder: (controller) {
                            return Text(
                              "${_calculatorController.firstNum} ${_calculatorController.operationString} ${_calculatorController.resultString}",

                              style: TextStyle(fontSize: 20, color: Color(0xffA6A6A6)),
                            );
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                        child: GetBuilder<CalculatorController>(
                          builder: (controller) {
                            return Text(
                              "${_calculatorController.secondNum}${_calculatorController.errorMsg}",
                              style: TextStyle(fontSize: 50, color: Colors.white),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 80, height: 40),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(primary: Color(0xff202020)),
                      child: Text("MC"),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 80, height: 40),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(primary: Color(0xff202020)),
                      child: Text("MR"),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 80, height: 40),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(primary: Color(0xff202020)),
                      child: Text("M+"),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 80, height: 40),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(primary: Color(0xff202020)),
                      child: Text("M-"),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 80, height: 40),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(primary: Color(0xff202020)),
                      child: Text("MS"),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 80, height: 40),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(primary: Color(0xff202020)),
                      child: Text("Mv"),
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
                        constraints: BoxConstraints.tightFor(height: 100),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(primary: Color(0xff323232)),
                          child: Center(child: Text("%", style: TextStyle(fontSize: 30, color: Colors.white))),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(height: 100),
                        child: ElevatedButton(
                          onPressed: () {
                            _calculatorController.CE();
                          },
                          style: ElevatedButton.styleFrom(primary: Color(0xff323232)),
                          child: Center(child: Text("CE", style: TextStyle(fontSize: 30, color: Colors.white))),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(height: 100),
                        child: ElevatedButton(
                          onPressed: () {
                            _calculatorController.C();
                          },
                          style: ElevatedButton.styleFrom(primary: Color(0xff323232)),
                          child: Center(child: Text("C", style: TextStyle(fontSize: 30, color: Colors.white))),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(height: 100),
                        child: ElevatedButton(
                          onPressed: () {},
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
                        constraints: BoxConstraints.tightFor(height: 100),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(primary: Color(0xff323232)),
                          child: Center(child: Text("1/X", style: TextStyle(fontSize: 30, color: Colors.white))),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(height: 100),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(primary: Color(0xff323232)),
                          child: Center(child: Text("x²", style: TextStyle(fontSize: 30, color: Colors.white))),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(height: 100),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(primary: Color(0xff323232)),
                          child: Center(child: Text("²√x", style: TextStyle(fontSize: 30, color: Colors.white))),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(height: 100),
                        child: ElevatedButton(
                          onPressed: () {
                            _calculatorController.operation("divide");
                          },
                          style: ElevatedButton.styleFrom(primary: Color(0xff323232)),
                          child: Center(child: Text("÷", style: TextStyle(fontSize: 30, color: Colors.white))),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    // 3
                    children: <Widget>[
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(height: 100),
                        child: ElevatedButton(
                          onPressed: () {
                            _calculatorController.num("7");
                          },
                          style: ElevatedButton.styleFrom(primary: Color(0xff3B3B3B)),
                          child: Center(child: Text("7", style: TextStyle(fontSize: 30, color: Colors.white))),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(height: 100),
                        child: ElevatedButton(
                          onPressed: () {
                            _calculatorController.num("8");
                          },
                          style: ElevatedButton.styleFrom(primary: Color(0xff3B3B3B)),
                          child: Center(child: Text("8", style: TextStyle(fontSize: 30, color: Colors.white))),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(height: 100),
                        child: ElevatedButton(
                          onPressed: () {
                            _calculatorController.num("9");
                          },
                          style: ElevatedButton.styleFrom(primary: Color(0xff3B3B3B)),
                          child: Center(child: Text("9", style: TextStyle(fontSize: 30, color: Colors.white))),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(height: 100),
                        child: ElevatedButton(
                          onPressed: () {
                            _calculatorController.operation("multiply");
                          },
                          style: ElevatedButton.styleFrom(primary: Color(0xff323232)),
                          child: Center(child: Text("*", style: TextStyle(fontSize: 30, color: Colors.white))),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    // 4
                    children: <Widget>[
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(height: 100),
                        child: ElevatedButton(
                          onPressed: () {
                            _calculatorController.num("4");
                          },
                          style: ElevatedButton.styleFrom(primary: Color(0xff3B3B3B)),
                          child: Center(child: Text("4", style: TextStyle(fontSize: 30, color: Colors.white))),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(height: 100),
                        child: ElevatedButton(
                          onPressed: () {
                            _calculatorController.num("5");
                          },
                          style: ElevatedButton.styleFrom(primary: Color(0xff3B3B3B)),
                          child: Center(child: Text("5", style: TextStyle(fontSize: 30, color: Colors.white))),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(height: 100),
                        child: ElevatedButton(
                          onPressed: () {
                            _calculatorController.num("6");
                          },
                          style: ElevatedButton.styleFrom(primary: Color(0xff3B3B3B)),
                          child: Center(child: Text("6", style: TextStyle(fontSize: 30, color: Colors.white))),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(height: 100),
                        child: ElevatedButton(
                          onPressed: () {
                            _calculatorController.operation("subtract");
                          },
                          style: ElevatedButton.styleFrom(primary: Color(0xff323232)),
                          child: Center(child: Text("-", style: TextStyle(fontSize: 30, color: Colors.white))),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    // 5
                    children: <Widget>[
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(height: 100),
                        child: ElevatedButton(
                          onPressed: () {
                            _calculatorController.num("1");
                          },
                          style: ElevatedButton.styleFrom(primary: Color(0xff3B3B3B)),
                          child: Center(child: Text("1", style: TextStyle(fontSize: 30, color: Colors.white))),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(height: 100),
                        child: ElevatedButton(
                          onPressed: () {
                            _calculatorController.num("2");
                          },
                          style: ElevatedButton.styleFrom(primary: Color(0xff3B3B3B)),
                          child: Center(child: Text("2", style: TextStyle(fontSize: 30, color: Colors.white))),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(height: 100),
                        child: ElevatedButton(
                          onPressed: () {
                            _calculatorController.num("3");
                          },
                          style: ElevatedButton.styleFrom(primary: Color(0xff3B3B3B)),
                          child: Center(child: Text("3", style: TextStyle(fontSize: 30, color: Colors.white))),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(height: 100),
                        child: ElevatedButton(
                          onPressed: () {
                            _calculatorController.operation("plus");
                          },
                          style: ElevatedButton.styleFrom(primary: Color(0xff323232)),
                          child: Center(child: Text("+", style: TextStyle(fontSize: 30, color: Colors.white))),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    // 6
                    children: <Widget>[
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(height: 100),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(primary: Color(0xff3B3B3B)),
                          child: Center(child: Text("+/_", style: TextStyle(fontSize: 30, color: Colors.white))),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(height: 100),
                        child: ElevatedButton(
                          onPressed: () {
                            _calculatorController.num("0");
                          },
                          style: ElevatedButton.styleFrom(primary: Color(0xff3B3B3B)),
                          child: Center(child: Text("0", style: TextStyle(fontSize: 30, color: Colors.white))),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(height: 100),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(primary: Color(0xff3B3B3B)),
                          child: Center(child: Text(".", style: TextStyle(fontSize: 30, color: Colors.white))),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(height: 100),
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
          ),
        ),
      ),
    );
  }
}
