import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  Button({
    Key? key,
    required this.buttonText,
    required this.buttonHeight,
    required this.buttonColor, required this.onButtonPressed,
  }) : super(key: key);

  final String buttonText;
  final double buttonHeight;
  final Color buttonColor;
  final Function(String) onButtonPressed;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * widget.buttonHeight,
      color: widget.buttonColor,
      child: FlatButton(
        child: Text(
          widget.buttonText,
          style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500),
        ),
        onPressed: (){
          setState(() {
            widget.onButtonPressed(widget.buttonText);
          });
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
          side: const BorderSide(
            width: 2,
            color: Colors.white12,
            style: BorderStyle.solid,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
      ),
    );
  }
}
