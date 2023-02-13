import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  var wtcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var inchcontroller = TextEditingController();
  var result = '';
  var bgcolor = Colors.indigo.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI'),
        ),
        body: Container(
          color: bgcolor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'BMI',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: wtcontroller,
                    decoration: InputDecoration(
                        labelText: ('your weight in kg'),
                        prefixIcon: Icon(Icons.line_weight_rounded)),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  TextField(
                    controller: ftcontroller,
                    decoration: InputDecoration(
                        labelText: ('your height in feet'),
                        prefixIcon: Icon(Icons.height)),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  TextField(
                    controller: inchcontroller,
                    decoration: InputDecoration(
                        labelText: ('your height in inches'),
                        prefixIcon: Icon(Icons.height)),
                    keyboardType: TextInputType.number,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var wt = wtcontroller.text.toString();
                        var ft = ftcontroller.text.toString();
                        var inch = inchcontroller.text.toString();

                        if (wt != '' && ft != '' && inch != '') {
                          //BMI calculation
                          var iwt = int.parse(wt);
                          var ift = int.parse(ft);
                          var iinch = int.parse(inch);

                          var tinch = (ift * 12) + iinch;
                          var tcm = tinch * 2.54;
                          var tm = tcm / 100;

                          var bmi = iwt / (tm * tm); // bmi formula

                          var msg = '';

                          if (bmi > 25) {
                            msg = 'You are overweight';
                            bgcolor = Colors.red.shade200;
                          } else if (bmi < 18) {
                            msg = 'you are underweight';
                            bgcolor = Colors.orange.shade200;
                          } else {
                            msg = 'you  are Healthy';
                            bgcolor = Colors.green.shade200;
                          }

                          setState(() {
                            result =
                                '$msg \n your BMI is: ${bmi.toStringAsFixed(2)}';
                          });
                        } else {
                          setState(() {
                            result = 'please fill all the required field';
                          });
                        }
                      },
                      child: Text('calculate')),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    result,
                    style: TextStyle(fontSize: 21),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
