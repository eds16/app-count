import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "People Count",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _count = 0;
  String _text = "PODE ENTRAR!";

  void _changeCount(int value) {
    setState(() {
      _count += value;
      if (_count >= 20) {
        _text = "LOTOU!";
        _count = 20;
      } else if (_count < 20 && _count >= 0) {
        _text = "PODE ENTRAR!";
      } else {
        _count = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/barranco.jpg",
          fit: BoxFit.fill,
          height: 1250.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            bodyText("PINGUNÇOS: $_count"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                myElevatedButton("+1", _changeCount, 1),
                myElevatedButton("-1", _changeCount, -1),
              ],
            ),
            bodyText(_text),
          ],
        ),
      ],
    );
  }
}

Text bodyText(String text) {
  return Text(
    text,
    style: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none,
    ),
  );
}

Padding myElevatedButton(String myText, Function myFunction, int value) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: SizedBox(
      width: 100.0,
      height: 50.0,
      child: ElevatedButton(
        child: Icon(
          value == 1
              ? Icons.arrow_upward
              : Icons.arrow_downward, //arrow_upward,
          color: value == 1 ? Colors.greenAccent : Colors.redAccent,
          size: 24.0,
        ),
        onPressed: () => myFunction(value),
      ),
    ),
  );
}
