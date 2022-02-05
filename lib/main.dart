import 'package:flutter/material.dart';
import 'package:simple_calculator/ui/calclator_screen.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatelessWidget{
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData.dark().copyWith(
        backgroundColor: Colors.black,
      ),
      home: CalculatorScreen(),
    );
  }
}
