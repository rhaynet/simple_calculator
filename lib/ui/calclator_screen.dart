import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:simple_calculator/widgets/calculator_buttons.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String equation = '0';
  String expression = '0';
  String result = '0';
  double equation_fontsize = 30;
  double result_fontsize = 40;

  buttonPressed(String buttonText) {
    setState(() {
      //when clear button is pressed
      if (buttonText == 'C') {
        equation = '0';
        result = '0';
        equation_fontsize = 38;
        result_fontsize = 48;
      }

      //when delete button is pressed
      else if (buttonText == 'Del.') {
        equation = equation.substring(0, equation.length - 1);
        if (equation == '') {
          equation = '0';
        }
        equation_fontsize = 48;
        result_fontsize = 38;
      }

      //when equal-to button is pressed
      else if (buttonText == '=') {
        equation_fontsize = 38;
        result_fontsize = 48;
        expression = equation;
        expression = expression.replaceAll('x', '*');
        // expression = expression.replaceAll('', '/');

        try {
          Parser parser = Parser();
          Expression exp = parser.parse(expression);

          ContextModel contextModel = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, contextModel)}';
        } catch (e) {
          print(e);
        }
      }
      // This is for when the pther buttons are pressed
      else {
        equation_fontsize = 48;
        result_fontsize = 38;
        if (equation == '0') {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'Calculator',
      //     style: TextStyle(
      //       fontWeight: FontWeight.bold,
      //       fontSize: 25.0,
      //     ),
      //   ),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Spacer(),
          //container to show the equation
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(
              equation,
              style: TextStyle(fontSize: equation_fontsize),
            ),
          ),
          //container to show the Result
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(
              result,
              style: TextStyle(fontSize: result_fontsize),
            ),
          ),
          Expanded(child: Divider()),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Table(
                  children: [
                    TableRow(children: [
                      Button(
                        buttonText: 'C',
                        buttonColor: Colors.green,
                        buttonHeight: 1,
                        onButtonPressed: (buttonText){
                          buttonPressed(buttonText);
                        },
                      ),
                      Button(
                        buttonText: 'Del.',
                        buttonColor: Colors.redAccent,
                        buttonHeight: 1,
                        onButtonPressed: (buttonText){
                          buttonPressed(buttonText);
                        },
                      ),
                      Button(
                        buttonText: '/',
                        buttonColor: Colors.black38,
                        buttonHeight: 1,
                        onButtonPressed: (buttonText){
                          buttonPressed(buttonText);
                        },
                      ),
                    ]),
                    TableRow(
                      children: [
                        Button(
                          buttonText: '9',
                          buttonColor: Colors.black,
                          buttonHeight: 1,
                          onButtonPressed: (buttonText){
                            buttonPressed(buttonText);
                          },
                        ),
                        Button(
                          buttonText: '8',
                          buttonColor: Colors.black,
                          buttonHeight: 1,
                          onButtonPressed: (buttonText){
                            buttonPressed(buttonText);
                          },
                        ),
                        Button(
                          buttonText: '7',
                          buttonColor: Colors.black,
                          buttonHeight: 1,
                          onButtonPressed: (buttonText){
                            buttonPressed(buttonText);
                          },
                        ),
                      ]
                    ),
                    TableRow(
                        children: [
                          Button(
                            buttonText: '6',
                            buttonColor: Colors.black,
                            buttonHeight: 1,
                            onButtonPressed: (buttonText){
                              buttonPressed(buttonText);
                            },
                          ),
                          Button(
                            buttonText: '5',
                            buttonColor: Colors.black,
                            buttonHeight: 1,
                            onButtonPressed: (buttonText){
                              buttonPressed(buttonText);
                            },
                          ),
                          Button(
                            buttonText: '4',
                            buttonColor: Colors.black,
                            buttonHeight: 1,
                            onButtonPressed: (buttonText){
                              buttonPressed(buttonText);
                            },
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          Button(
                            buttonText: '3',
                            buttonColor: Colors.black,
                            buttonHeight: 1,
                            onButtonPressed: (buttonText){
                              buttonPressed(buttonText);
                            },
                          ),
                          Button(
                            buttonText: '2',
                            buttonColor: Colors.black,
                            buttonHeight: 1,
                            onButtonPressed: (buttonText){
                              buttonPressed(buttonText);
                            },
                          ),
                          Button(
                            buttonText: '1',
                            buttonColor: Colors.black,
                            buttonHeight: 1,
                            onButtonPressed: (buttonText){
                              buttonPressed(buttonText);
                            },
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          Button(
                            buttonText: '.',
                            buttonColor: Colors.black,
                            buttonHeight: 1,
                            onButtonPressed: (buttonText){
                              buttonPressed(buttonText);
                            },
                          ),
                          Button(
                            buttonText: '0',
                            buttonColor: Colors.black,
                            buttonHeight: 1,
                            onButtonPressed: (buttonText){
                              buttonPressed(buttonText);
                            },
                          ),
                          Button(
                            buttonText: '00',
                            buttonColor: Colors.black,
                            buttonHeight: 1,
                            onButtonPressed: (buttonText){
                              buttonPressed(buttonText);
                            },
                          ),
                        ]
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        Button(
                          buttonText: 'x',
                          buttonColor: Colors.black,
                          buttonHeight: 1,
                          onButtonPressed: (buttonText){
                            buttonPressed(buttonText);
                          },
                        ),
                      ]
                    ),
                    TableRow(
                        children: [
                          Button(
                            buttonText: '-',
                            buttonColor: Colors.black,
                            buttonHeight: 1,
                            onButtonPressed: (buttonText){
                              buttonPressed(buttonText);
                            },
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          Button(
                            buttonText: '+',
                            buttonColor: Colors.black,
                            buttonHeight: 1,
                            onButtonPressed: (buttonText){
                              buttonPressed(buttonText);
                            },
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          Button(
                            buttonText: '=',
                            buttonColor: Colors.orange,
                            buttonHeight: 1,
                            onButtonPressed: (buttonText){
                              buttonPressed(buttonText);
                            },
                          ),
                        ]
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
