import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Business Calculator',
      theme: ThemeData(
        // This is the theme of your application.

        primarySwatch: Colors.lightBlue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Business Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result = "0";
  String _result = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    print(buttonText);
    if (buttonText == "AC") {
      _result = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "X" ||
        buttonText == "/") {
      num1 = double.parse(result);
      operand = buttonText;
      _result = "0";
    } else if (buttonText == ".") {
      if (_result.contains(".")) {
        print("Already contains a decimal");
        return;
      } else {
        _result = _result + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(result);
      if (operand == "+") {
        _result = (num1 + num2).toString();
      }

      if (operand == "-") {
        _result = (num1 - num2).toString();
      }

      if (operand == "X") {
        _result = (num1 * num2).toString();
      }

      if (operand == "/") {
        _result = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
//      _result = "0";
      operand = "";
    } else {
      _result = _result + buttonText;
    }
    print(_result);
    setState(() {
      result = double.parse(_result).toStringAsFixed(2);
    });
  }

  Widget button_fn(String buttonText) {
    return new Expanded(
        child: new OutlineButton(
      child: new Text(
        buttonText,
        style: TextStyle(
          fontSize: 15.40,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () => {buttonPressed(buttonText)},
      //color: Colors.blueGrey,
      //textColor: Colors.white,
      padding:
          EdgeInsets.all(24.0), // apply padding of 24.0 on all sides on button
    )

        // Expanded: its child will take up all the available space
        );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              new Container(
                  alignment: Alignment.centerRight,
                  padding: new EdgeInsets.symmetric(
                      vertical: 40.0, horizontal: 12.0),
                  // Container has inbuild padding
                  child: new Text(result,
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 48.0))),
              new Expanded(child: Divider()
                  // Divider makes text widgets at the top while button at the bottom and takes all space

                  ),
              //new Text("0"),
              // put a divider between text and button
//              new Expanded(child: Divider()
//                  // Divider makes text widgets at the top while button at the bottom and takes all space
//                  ),
              // now create Column Widget with children property wrap the row Widgets
              new Column(
                children: [
                  new Row(
                    children: [
                      button_fn("MC"),
                      button_fn("M+"),
                      button_fn("M-"),
                      button_fn("MR")
                    ],
                  ),
                  new Row(
                    children: [
                      button_fn("AC"),
                      button_fn("BACK"),
                      button_fn("+/-"),
                      button_fn("/")
                    ],
                  ),
                  new Row(
                    children: [
                      button_fn("7"),
                      button_fn("8"),
                      button_fn("9"),
                      button_fn("X")
                    ],
                  ),
                  new Row(
                    children: [
                      button_fn("4"),
                      button_fn("5"),
                      button_fn("6"),
                      button_fn("-")
                    ],
                  ),
                  new Row(
                    children: [
                      button_fn("1"),
                      button_fn("2"),
                      button_fn("3"),
                      button_fn("+")
                    ],
                  ),
                  new Row(
                    children: [
                      button_fn("%"),
                      button_fn("0"),
                      button_fn("."),
                      button_fn("=")
                    ],
                  )
                ],
              )
//              new Row(
              // Row has property called children which takes array of Widgets this makes button horizontal
//                children: [
//                  new Expanded(
//                    child: new MaterialButton(
//                      child: new Text("1"),
//                      onPressed: () => {},
//                      color: Colors.blueGrey,
//                      textColor: Colors.white,
//                    ),
//
//                    // Expanded: its child will take up all the available space
//                  ),
//                  new Expanded(
//                    child: new MaterialButton(
//                      child: new Text("1"),
//                      onPressed: () => {},
//                      color: Colors.blueGrey,
//                      textColor: Colors.white,
//                    ),
//
//                    // Expanded: its child will take up all the available space
//                  ),
//                  new Expanded(
//                    child: new MaterialButton(
//                      child: new Text("1"),
//                      onPressed: () => {},
//                      color: Colors.blueGrey,
//                      textColor: Colors.white,
//                    ),
//
//                    // Expanded: its child will take up all the available space
//                  ),
//                  new Expanded(
//                    child: new MaterialButton(
//                      child: new Text("1"),
//                      onPressed: () => {},
//                      color: Colors.blueGrey,
//                      textColor: Colors.white,
//                    ),
//
//                    // Expanded: its child will take up all the available space
//                  )
//                  button_fn(),
//                  button_fn(),
//                  button_fn(),
//                  button_fn()
//                ],
//              )
            ],
          ),
        ));
  }
}
