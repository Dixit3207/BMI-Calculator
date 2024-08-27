import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculate BMI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI Calculator '),
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
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor = Colors.indigo.shade300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('BMI Calculator'),
          centerTitle: true,
        ),
        body: Container(
            color: bgColor,
            child: Center(
              child: Container(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "BMI",
                      style:
                          TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    TextField(
                      controller: wtController,
                      decoration: InputDecoration(
                          label: Text("Enter your weight(in Kgs))"),
                          prefixIcon: Icon(Icons.line_weight)),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    TextField(
                      controller: ftController,
                      decoration: InputDecoration(
                          label: Text("Enter your height(in feet)"),
                          prefixIcon: Icon(Icons.line_weight)),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    TextField(
                      controller: inController,
                      decoration: InputDecoration(
                          label: Text("Enter your height(in inch)"),
                          prefixIcon: Icon(Icons.line_weight)),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          var wt = wtController.text.toString();
                          var ft = ftController.text.toString();
                          var inch = inController.text.toString();

                          if (wt != "" && ft != "" && inch != "") {
                            var iwt = int.parse(wt);
                            var ift = int.parse(ft);
                            var iInch = int.parse(inch);

                            var tInch = (ift * 12) + iInch;

                            var tCm = tInch * 2.54;

                            var tM = tCm / 100;

                            var bmi = iwt / (tM * tM);

                            var msg = "";

                            if (bmi > 25 && bmi < 29) {
                              msg = "You are overweight!!";
                              bgColor = Colors.yellow.shade300;
                            } else if (bmi > 16 && bmi < 18) {
                              msg = "You are underweight";
                              bgColor = Color.fromARGB(255, 52, 143, 212);
                            } else if (bmi > 29) {
                              msg = "Obese";

                              bgColor = Color.fromARGB(255, 255, 111, 0);
                            } else {
                              msg = "   You are healthy ";
                              bgColor = Colors.green;
                            }

                            setState(() {
                              result =
                                  "$msg \n Your BMI is :${bmi.toStringAsFixed(2)}";
                            });
                          } else {
                            setState(() {
                              result = "Plese fill all the required field";
                            });
                          }
                        },
                        child: Text('Calculate')),
                    SizedBox(
                      height: 11,
                    ),
                    Text(
                      result,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )));
  }
}
