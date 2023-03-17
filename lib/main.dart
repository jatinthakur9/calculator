import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var userInput = '';
  var answer = '';

  final List<String> buttons = [
    "c",
    "DEL",
    "% ",
    "/",
    "9",
    "8",
    "7",
    "x",
    "6",
    "5",
    "4 ",
    "-",
    "3",
    "2",
    "1 ",
    "+",
    "0",
    ".",
    "Ans ",
    "=",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 141, 208, 143),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(30),
                    alignment: Alignment.center,
                    child: Text(
                      userInput,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      answer,
                      style: const TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: Center(
                  child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return buttonn(
                      buttonTapped: () {
                        setState(() {
                          userInput = "";
                        });
                      },
                      buttontext: buttons[index],
                      color: Colors.amber,
                      textcolor: Colors.white,
                    );
                  } else if (index == 1) {
                    return buttonn(
                      buttonTapped: () {
                        setState(() {
                          userInput =
                              userInput.substring(0, userInput.length - 1);
                        });
                      },
                      buttontext: buttons[index],
                      color: Colors.pink,
                      textcolor: Colors.white,
                    );
                  } else {
                    return buttonn(
                      buttonTapped: () {
                        setState(() {
                          userInput += buttons[index];
                        });
                      },
                      buttontext: buttons[index],
                      color: isOperator(buttons[index])
                          ? Colors.blueAccent
                          : Color.fromARGB(255, 242, 243, 244),
                      textcolor: isOperator(buttons[index])
                          ? Colors.white
                          : Colors.black,
                    );
                  }
                },
              )),
            ),
          ),
        ],
      ),
    );
  }
}

bool isOperator(String x) {
  if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
    return true;
  }
  return false;
}
