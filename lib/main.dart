import 'dart:math';

import 'package:bmi/calc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double thumvalue = 181;
  int weightvalue = 60;
  int agevalue = 18;
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1d2136),
      appBar: AppBar(
        backgroundColor: const Color(0xff1d2136),
        title: Center(
          child: Text(
            'BMI Calculator'.toUpperCase(),
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isMale = true;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: isMale
                                    ? const Color(0xff323244)
                                    : const Color(0xff24263b),
                              ),
                              margin: const EdgeInsets.all(15),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Icon(
                                      Icons.male,
                                      size: 85,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'MALE',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isMale = false;
                              });
                            },
                            //0xff323244
                            child: Container(
                              margin: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: !isMale
                                    ? const Color(0xff323244)
                                    : const Color(0xff24263b),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Icon(
                                      Icons.female,
                                      size: 85,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'FEMALE',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xff323244),
                        ),
                        margin: const EdgeInsets.all(15),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text(
                                'HEIGHT',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                crossAxisAlignment:
                                    CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    thumvalue.toInt().toString(),
                                    style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'CM'.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                ],
                              ),
                              Slider(
                                  value: thumvalue,
                                  min: 100,
                                  max: 220,
                                  thumbColor: const Color(0xffe83d67),
                                  activeColor: const Color(0xffe83d67),
                                  onChanged: (newValue) {
                                    setState(() {
                                      thumvalue = newValue;
                                    });
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Custom(
                          type: 'WEIGHT',
                          value: weightvalue,
                          pluspressed: () {
                            setState(() {
                              weightvalue++;
                            });
                          },
                          minuspressed: () {
                            setState(() {
                              weightvalue--;
                            });
                          },
                        ),
                        Custom(
                          type: 'AGE',
                          value: agevalue,
                          pluspressed: () {
                            setState(() {
                              agevalue++;
                            });
                          },
                          minuspressed: () {
                            setState(() {
                              agevalue--;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                final double result =
                    weightvalue / pow(thumvalue / 100, 2);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Calculater(result: result)));
              },
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xffe83d67),
                child: const Center(
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Custom extends StatelessWidget {
  const Custom({
    Key? key,
    required this.type,
    required this.value,
    required this.minuspressed,
    required this.pluspressed,
  }) : super(key: key);
  final String type;
  final int value;
  final void Function() minuspressed;
  final void Function() pluspressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xff323244),
          ),
          margin: const EdgeInsets.all(15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  type,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  value.toString(),
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color(0xff5d5f6e),
                      radius: 25,
                      child: IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: minuspressed,
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: const Color(0xff5d5f6e),
                      radius: 25,
                      child: IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: pluspressed,
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
