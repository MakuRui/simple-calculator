import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.cyan),
      home: const MyCalculator(),
    );
  }
}

class MyCalculator extends StatefulWidget {
  const MyCalculator({Key? key}) : super(key: key);


  @override
  State<MyCalculator> createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {

  String display = "0";

  String display1 = "0";
  int num1 = 0;
  int num2 = 0;
  String operand = "";

  buttonPressed(String buttonText){
    if(buttonText == "C"){
      print("case 1");

      display1 = "0";
      num1 = 0;
      num2 = 0;
      operand = "";

    }else if(buttonText == "+" || buttonText == "-" || buttonText == "×" || buttonText == "÷"){
      print("case 2");
      num1 = int.parse(display);
      operand = buttonText;
      display1 = "0";

    }else if(buttonText == "="){
      print("case 3");
      num2 = int.parse(display);
      if(operand == "+"){
        display1 = (num1 + num2).toString();
      }
      if(operand == "-"){
        display1 = (num1 - num2).toString();
      }
      if(operand == "×"){
        display1 = (num1 * num2).toString();
      }
      if(operand == "÷"){
        display1 = (num1 / num2).toString();
      }

      num1 = 0;
      num2 = 0;
      operand = "";

    }else{
      print("case 4");
      display1 = display1 + buttonText;

    }

    print(display1);

    setState(() {

      display = int.parse(display1).toString();

    });

  }

  Widget createButton(String buttonText){
    return Expanded(
      child: OutlinedButton(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(buttonText,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          style: OutlinedButton.styleFrom(backgroundColor: Colors.white70, side: BorderSide(color: Colors.amber)),
          onPressed: () =>
              buttonPressed(buttonText)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(children: [
        //OUTPUT DISPLAY
        Container(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 12.0,
              ),
              child: Text(display,
                style: const TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.bold),),
            )),

        const Expanded(
          child:Divider(),
        ),
        //BUTTON DISPLAY
        Column(
          children: [
            Row(
              children: [
                createButton("7"),
                createButton("8"),
                createButton("9"),
                createButton("÷"),
              ],
            ),
            Row(
              children: [
                createButton("4"),
                createButton("5"),
                createButton("6"),
                createButton("×"),
              ],
            ),
            Row(
              children: [
                createButton("1"),
                createButton("2"),
                createButton("3"),
                createButton("-"),
              ],
            ),
            Row(
              children: [
                createButton("00"),
                createButton("0"),
                createButton("+"),
              ],
            ),
            Row(
              children: [
                createButton("C"),
                createButton("="),
              ],
            ),
          ],
        )

      ]
      ),
    );
  }
}
