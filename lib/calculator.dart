import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String result = "", opt = "", text = '0';
  int first = 0, second = 0;

  void btnClicked(String btnText) {
    if (btnText == "C") {
      result = "";
      text = "";
      first = 0;
      second = 0;
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "/") {
      first = int.parse(text);
      result = "";
      opt = btnText;
    } else if (btnText == "=") {
      second = int.parse(text);
      if (opt == "+") {
        result = (first + second).toString();
      } else if (opt == "-") {
        result = (first - second).toString();
      } else if (opt == "x") {
        result = (first * second).toString();
      } else if (opt == "/") {
        result = (first ~/ second).toString();
      }
    } else {
      result = int.parse(text + btnText).toString();
    }

    setState(() {
      text = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    String dsad = "fdsf";
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 39, 39, 39),
        appBar: AppBar(title: const Text("Calculator App")),
        body: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Expanded(
            child: Container(
                color: const Color.fromARGB(255, 195, 195, 195),
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text,
                    style: const TextStyle(fontSize: 60, color: Colors.black),
                  ),
                )),
          ),
          Row(children: [
            CalculatorButton("7"),
            CalculatorButton("8"),
            CalculatorButton("9"),
            CalculatorButton("+"),
          ]),
          Row(children: [
            CalculatorButton("4"),
            CalculatorButton("5"),
            CalculatorButton("6"),
            CalculatorButton("-"),
          ]),
          Row(children: [
            CalculatorButton("1"),
            CalculatorButton("2"),
            CalculatorButton("3"),
            CalculatorButton("x"),
          ]),
          Row(children: [
            CalculatorButton("C"),
            CalculatorButton("0"),
            CalculatorButton("="),
            CalculatorButton("/"),
          ]),
        ]),
      ),
    );
  }

  Widget CalculatorButton(String value) {
    return Expanded(
      child: OutlinedButton(
          onPressed: () {
            btnClicked(value);
          },
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              value,
              style: const TextStyle(fontSize: 25),
            ),
          )),
    );
  }
}
