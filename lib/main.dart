


//This is the old code 
/*import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
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
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/






//This is new code 
import 'package:flutter/material.dart';
import 'buttons.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
runApp(MyApp());
}

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
	return MaterialApp(
	debugShowCheckedModeBanner: false,
	home: HomePage(),
	); // MaterialApp
}
}

class HomePage extends StatefulWidget {
@override
_HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
var userInput = '';
var answer = '';

// Array of button
final List<String> buttons = [
	'C',
	'+/-',
	'%',
	'DEL',
	'7',
	'8',
	'9',
	'/',
	'4',
	'5',
	'6',
	'x',
	'1',
	'2',
	'3',
	'-',
	'0',
	'.',
	'=',
	'+',
];

@override
Widget build(BuildContext context) {
	return Scaffold(
	appBar: new AppBar(
		title: new Text("Calculator"),
	), //AppBar
	backgroundColor: Colors.white38,
	body: Column(
		children: <Widget>[
		Expanded(
			child: Container(
			child: Column(
				mainAxisAlignment: MainAxisAlignment.spaceEvenly,
				children: <Widget>[
					Container(
					padding: EdgeInsets.all(20),
					alignment: Alignment.centerRight,
					child: Text(
						userInput,
						style: TextStyle(fontSize: 18, color: Colors.white),
					),
					),
					Container(
					padding: EdgeInsets.all(15),
					alignment: Alignment.centerRight,
					child: Text(
						answer,
						style: TextStyle(
							fontSize: 30,
							color: Colors.white,
							fontWeight: FontWeight.bold),
					),
					)
				]),
			),
		),
		Expanded(
			flex: 3,
			child: Container(
			child: GridView.builder(
				itemCount: buttons.length,
				gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
					crossAxisCount: 4),
				itemBuilder: (BuildContext context, int index) {
					// Clear Button
					if (index == 0) {
					return MyButton(
						buttontapped: () {
						setState(() {
							userInput = '';
							answer = '0';
						});
						},
						buttonText: buttons[index],
						color: Colors.blue[50],
						textColor: Colors.black,
					);
					}

					// +/- button
					else if (index == 1) {
					return MyButton(
						buttonText: buttons[index],
						color: Colors.blue[50],
						textColor: Colors.black,
					);
					}
					// % Button
					else if (index == 2) {
					return MyButton(
						buttontapped: () {
						setState(() {
							userInput += buttons[index];
						});
						},
						buttonText: buttons[index],
						color: Colors.blue[50],
						textColor: Colors.black,
					);
					}
					// Delete Button
					else if (index == 3) {
					return MyButton(
						buttontapped: () {
						setState(() {
							userInput =
								userInput.substring(0, userInput.length - 1);
						});
						},
						buttonText: buttons[index],
						color: Colors.blue[50],
						textColor: Colors.black,
					);
					}
					// Equal_to Button
					else if (index == 18) {
					return MyButton(
						buttontapped: () {
						setState(() {
							equalPressed();
						});
						},
						buttonText: buttons[index],
						color: Colors.orange[700],
						textColor: Colors.white,
					);
					}

					// other buttons
					else {
					return MyButton(
						buttontapped: () {
						setState(() {
							userInput += buttons[index];
						});
						},
						buttonText: buttons[index],
						color: isOperator(buttons[index])
							? Colors.blueAccent
							: Colors.white,
						textColor: isOperator(buttons[index])
							? Colors.white
							: Colors.black,
					);
					}
				}), // GridView.builder
			),
		),
		],
	),
	);
}

bool isOperator(String x) {
	if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
	return true;
	}
	return false;
}

// function to calculate the input operation
void equalPressed() {
	String finaluserinput = userInput;
	finaluserinput = userInput.replaceAll('x', '*');

	Parser p = Parser();
	Expression exp = p.parse(finaluserinput);
	ContextModel cm = ContextModel();
	double eval = exp.evaluate(EvaluationType.REAL, cm);
	answer = eval.toString();
}
}
