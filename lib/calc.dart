import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result {
  Result({
    required this.state,
    required this.result,
    required this.statement,
  });

  String state;
  String result;
  String statement;
}

class Calculater extends StatelessWidget {
  late final Result bmiResult;
  final double result;

  Calculater({
    Key? key,
    required this.result,
  }) : super(key: key) {
    bmiResult = getResult(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1d2136),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff1d2136),
        title: Center(
          child: Text(
            'your result'.toUpperCase(),
            style: const TextStyle(
              fontSize: 35,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xff323244),
                  ),
                  margin: const EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        bmiResult.state.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        bmiResult.result.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 100,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        bmiResult.statement.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  color: const Color(0xffe83d67),
                  child: const Center(
                    child: Text(
                      'RE-CALCULATE',
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
      ),
    );
  }
}

Result getResult(double res) {
  if (res < 18.5) {
    return Result(
        state: "Under-Weight",
        result: res.toStringAsFixed(1),
        statement: "You are under-weight! You need to eat more.");
  } else if (res > 24.9) {
    return Result(
        state: "Normal",
        result: res.toStringAsFixed(1),
        statement: "Your weight is perfect!");
  } else {
    return Result(
        state: "Over-Weight",
        result: res.toStringAsFixed(1),
        statement: "You are over-weight! You need to eat less.");
  }
}
