import 'package:calculator/dialogBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class LandscapeCalculator extends StatefulWidget {
  const LandscapeCalculator({super.key});

  @override
  State<LandscapeCalculator> createState() => _LandscapeCalculatorState();
}

class _LandscapeCalculatorState extends State<LandscapeCalculator> {
  var scrollController = ScrollController();
  int myTextLenght = 20;
  String myText = '';

  String zeroNumber = '0';

  String answer = '';

  var isTrue = true;

  String elseString = '';

  @override
  Widget build(BuildContext context) {
    var mqSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: mqSize.height * 0.1,
          width: mqSize.width * 0.9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                  child: (isTrue == false)
                      ? Flexible(
                          child: FittedBox(
                            child: Text(
                              answer,
                              style: const TextStyle(
                                  fontSize: 40,
                                  color: Color.fromARGB(255, 152, 152, 152)),
                            ),
                          ),
                        )
                      : const Text(''))
            ],
          ),
        ),
        SizedBox(
          height: mqSize.height * 0.15,
          width: mqSize.width * 0.9,
          child: Align(
            alignment: Alignment.centerRight,
            child: SingleChildScrollView(
              controller: scrollController,
              reverse: true,
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    myText == '' ? zeroNumber : myText,
                    style: const TextStyle(fontSize: 45, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),

        // --------------------------------------------------------------------------
        SizedBox(
          height: mqSize.height * 0.57,
          width: mqSize.width * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  height: mqSize.height * 0.1,
                  width: mqSize.width * 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: mqSize.height * 0.24,
                        width: mqSize.width * 0.22,
                        child: FloatingActionButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          backgroundColor: Colors.white.withOpacity(0.4),
                          splashColor: Colors.black.withOpacity(0.45),
                          onPressed: () {
                            setState(() {
                              // myText = '';
                              if (isTrue == false) {
                                isTrue = true;
                                myText = '';
                              }
                              // if (elseString == '') {
                              //   myText =
                              //       myText.substring(0, myText.length - 1);
                              // }
                              // answer = 0;
                              if (myText.isNotEmpty) {
                                myText = myText.substring(0, myText.length - 1);
                              } else {
                                myText = '';
                                answer.isEmpty;
                              }
                            });
                          },
                          child: FittedBox(
                            child: (isTrue == true)
                                ? const Icon(Icons.backspace,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    size: 20)
                                : const Text(
                                    'AC',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: mqSize.height * 0.24,
                        width: mqSize.width * 0.22,
                        child: FloatingActionButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          backgroundColor: Colors.white.withOpacity(0.4),
                          splashColor: Colors.white.withOpacity(0.5),
                          onPressed: () {
                            setState(() {
                              if (isTrue == false) {
                                isTrue = true;
                              }
                              myText += '(';
                            });
                          },
                          child: const FittedBox(
                              child: Text(
                            '(',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                      SizedBox(
                        height: mqSize.height * 0.24,
                        width: mqSize.width * 0.22,
                        child: FloatingActionButton(
                            splashColor: Colors.white.withOpacity(0.5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            backgroundColor: Colors.white.withOpacity(0.4),
                            onPressed: () {
                              setState(() {
                                if (isTrue == false) {
                                  isTrue = true;
                                }
                                myText += ')';
                              });
                            },
                            child: const FittedBox(
                                child: Text(
                              ')',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ))),
                      ),
                      SizedBox(
                        height: mqSize.height * 0.24,
                        width: mqSize.width * 0.22,
                        child: FloatingActionButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            splashColor: Colors.white.withOpacity(0.5),
                            backgroundColor: Colors.orange,
                            onPressed: () {
                              setState(() {
                                if (isTrue == false) {
                                  isTrue = true;
                                }
                                if (myText.isNotEmpty) {
                                  myText += '/';
                                }
                              });
                            },
                            child: const FittedBox(
                                child: Text(
                              '÷',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 50,
                              ),
                            ))),
                      ),
                    ],
                  )),

              // --------------------------------------------------------------------------
              // --------------------------------------------------------------------------
              // --------------------------------------------------------------------------

              // --------------------------------------------------------------------------
              SizedBox(
                  height: mqSize.height * 0.1,
                  width: mqSize.width * 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: mqSize.height * 0.24,
                        width: mqSize.width * 0.22,
                        child: FloatingActionButton(
                          splashColor: Colors.white.withOpacity(0.5),
                          backgroundColor: Colors.white.withOpacity(0.12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          onPressed: () {
                            setState(() {
                              if (isTrue == false) {
                                isTrue = true;
                                myText = '';
                              }

                              myText = "${myText}7";
                            });
                          },
                          child: const FittedBox(
                              child: Text(
                            '7',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 30),
                          )),
                        ),
                      ),
                      SizedBox(
                        height: mqSize.height * 0.24,
                        width: mqSize.width * 0.22,
                        child: FloatingActionButton(
                          splashColor: Colors.white.withOpacity(0.5),
                          backgroundColor: Colors.white.withOpacity(0.12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          onPressed: () {
                            setState(() {
                              if (isTrue == false) {
                                isTrue = true;
                                myText = '';
                              }
                              myText = "${myText}8";
                            });
                          },
                          child: const FittedBox(
                              child: Text(
                            '8',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 30),
                          )),
                        ),
                      ),
                      SizedBox(
                        height: mqSize.height * 0.24,
                        width: mqSize.width * 0.22,
                        child: FloatingActionButton(
                            splashColor: Colors.white.withOpacity(0.5),
                            backgroundColor: Colors.white.withOpacity(0.12),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            onPressed: () {
                              setState(() {
                                if (isTrue == false) {
                                  isTrue = true;
                                  myText = '';
                                }
                                myText = "${myText}9";
                              });
                            },
                            child: const FittedBox(
                                child: Text(
                              '9',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 30),
                            ))),
                      ),
                      SizedBox(
                        height: mqSize.height * 0.24,
                        width: mqSize.width * 0.22,
                        child: FloatingActionButton(
                            splashColor: Colors.white.withOpacity(0.5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            backgroundColor: Colors.orange,
                            onPressed: () {
                              setState(() {
                                if (isTrue == false) {
                                  isTrue = true;
                                }
                                if (myText.isNotEmpty) {
                                  myText += '*';
                                }
                              });
                            },
                            child: const FittedBox(
                              child: Icon(
                                Icons.close,
                                color: Color.fromARGB(255, 255, 255, 255),
                                size: 40,
                              ),
                            )),
                      ),
                    ],
                  )),
              // // --------------------------------------------------------------------------
              SizedBox(
                  height: mqSize.height * 0.1,
                  width: mqSize.width * 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: mqSize.height * 0.24,
                        width: mqSize.width * 0.22,
                        child: FloatingActionButton(
                          splashColor: Colors.white.withOpacity(0.5),
                          backgroundColor: Colors.white.withOpacity(0.12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          onPressed: () {
                            setState(() {
                              if (isTrue == false) {
                                isTrue = true;
                                myText = '';
                              }
                              myText = "${myText}4";
                            });
                          },
                          child: const FittedBox(
                              child: Text(
                            '4',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 30),
                          )),
                        ),
                      ),
                      SizedBox(
                        height: mqSize.height * 0.24,
                        width: mqSize.width * 0.22,
                        child: FloatingActionButton(
                          splashColor: Colors.white.withOpacity(0.5),
                          backgroundColor: Colors.white.withOpacity(0.12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          onPressed: () {
                            setState(() {
                              if (isTrue == false) {
                                isTrue = true;
                                myText = '';
                              }
                              myText = "${myText}5";
                            });
                          },
                          child: const FittedBox(
                              child: Text(
                            '5',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 30),
                          )),
                        ),
                      ),
                      SizedBox(
                        height: mqSize.height * 0.24,
                        width: mqSize.width * 0.22,
                        child: FloatingActionButton(
                            splashColor: Colors.white.withOpacity(0.5),
                            backgroundColor: Colors.white.withOpacity(0.12),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            onPressed: () {
                              setState(() {
                                if (isTrue == false) {
                                  isTrue = true;
                                  myText = '';
                                }
                                myText = "${myText}6";
                              });
                            },
                            child: const FittedBox(
                                child: Text(
                              '6',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 30),
                            ))),
                      ),
                      SizedBox(
                        height: mqSize.height * 0.24,
                        width: mqSize.width * 0.22,
                        child: FloatingActionButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            splashColor: Colors.white.withOpacity(0.5),
                            backgroundColor: Colors.orange,
                            onPressed: () {
                              setState(() {
                                if (isTrue == false) {
                                  isTrue = true;
                                }

                                myText += '-';
                              });
                            },
                            child: const FittedBox(
                              child: Icon(Icons.remove,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  size: 40),
                            )),
                      ),
                    ],
                  )),
              // ---------------------------------------------------------------------------------
              SizedBox(
                  height: mqSize.height * 0.1,
                  width: mqSize.width * 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: mqSize.height * 0.24,
                        width: mqSize.width * 0.22,
                        child: FloatingActionButton(
                          splashColor: Colors.white.withOpacity(0.5),
                          backgroundColor: Colors.white.withOpacity(0.12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          onPressed: () {
                            setState(() {
                              if (isTrue == false) {
                                isTrue = true;
                                myText = '';
                              }
                              myText = "${myText}1";
                            });
                          },
                          child: const FittedBox(
                              child: Text(
                            '1',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 30),
                          )),
                        ),
                      ),
                      SizedBox(
                        height: mqSize.height * 0.24,
                        width: mqSize.width * 0.22,
                        child: FloatingActionButton(
                          splashColor: Colors.white.withOpacity(0.5),
                          backgroundColor: Colors.white.withOpacity(0.12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          onPressed: () {
                            setState(() {
                              if (isTrue == false) {
                                isTrue = true;
                                myText = '';
                              }

                              myText = "${myText}2";
                            });
                          },
                          child: const FittedBox(
                              child: Text(
                            '2',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 30),
                          )),
                        ),
                      ),
                      SizedBox(
                        height: mqSize.height * 0.24,
                        width: mqSize.width * 0.22,
                        child: FloatingActionButton(
                            splashColor: Colors.white.withOpacity(0.5),
                            backgroundColor: Colors.white.withOpacity(0.12),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            onPressed: () {
                              setState(() {
                                if (isTrue == false) {
                                  isTrue = true;
                                  myText = '';
                                }

                                myText = "${myText}3";
                              });
                            },
                            child: const FittedBox(
                                child: Text(
                              '3',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 30),
                            ))),
                      ),
                      SizedBox(
                        height: mqSize.height * 0.24,
                        width: mqSize.width * 0.22,
                        child: FloatingActionButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            splashColor: Colors.white.withOpacity(0.5),
                            backgroundColor: Colors.orange,
                            onPressed: () {
                              setState(() {
                                if (isTrue == false) {
                                  isTrue = true;
                                }
                                if (myText.isNotEmpty) {
                                  myText += '+';
                                }
                              });
                            },
                            child: const FittedBox(
                              child: Icon(Icons.add,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  size: 40),
                            )),
                      ),
                    ],
                  )),

              // ----------------------------------------------------------------------------------
              SizedBox(
                  height: mqSize.height * 0.1,
                  width: mqSize.width * 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: mqSize.height * 0.24,
                        width: mqSize.width * 0.22,
                        child: FloatingActionButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          splashColor: Colors.white.withOpacity(0.5),
                          backgroundColor: Colors.white.withOpacity(0.12),
                          onPressed: () {
                            myDialogBox(context: context);
                          },
                          child: const FittedBox(
                            child: Icon(Icons.settings,
                                color: Color.fromARGB(255, 255, 255, 255),
                                size: 25),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: mqSize.height * 0.24,
                        width: mqSize.width * 0.22,
                        child: FloatingActionButton(
                          splashColor: Colors.white.withOpacity(0.5),
                          backgroundColor: Colors.white.withOpacity(0.12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          onPressed: () {
                            setState(() {
                              if (isTrue == false) {
                                isTrue = true;
                                myText = '';
                              }
                              myText = "${myText}0";
                            });
                          },
                          child: const FittedBox(
                            child: Icon(Icons.exposure_zero,
                                color: Color.fromARGB(255, 255, 255, 255),
                                size: 40),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: mqSize.height * 0.24,
                        width: mqSize.width * 0.22,
                        child: FloatingActionButton(
                            splashColor: Colors.white.withOpacity(0.5),
                            backgroundColor: Colors.white.withOpacity(0.12),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            onPressed: () {
                              if (isTrue == false) {
                                isTrue = true;
                              }
                              setState(() {
                                myText += ".";
                              });
                            },
                            child: const FittedBox(
                              child: Icon(Icons.fiber_manual_record,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  size: 7),
                            )),
                      ),
                      SizedBox(
                        height: mqSize.height * 0.24,
                        width: mqSize.width * 0.22,
                        child: FloatingActionButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            splashColor: Colors.white.withOpacity(0.5),
                            backgroundColor: Colors.orange,
                            onPressed: () {
                              try {
                                Parser p = Parser();
                                answer = myText;
                                Expression exp = p.parse(myText);
                                ContextModel cm = ContextModel();
                                num result =
                                    exp.evaluate(EvaluationType.REAL, cm);

                                setState(() {
                                  isTrue = false;
                                  // answer = result.toString();
                                  String converter = result.toString();
                                  if (myText.contains('.') ||
                                      myText.contains('/')) {
                                    myText = result.toString();
                                  } else {
                                    myText = result.toInt().toString();
                                  }
                                });
                              } catch (e) {
                                setState(() {
                                  answer = 'Error';
                                  print(e);
                                });
                              }
                            },
                            child: const FittedBox(
                              child: Icon(Icons.drag_handle,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  size: 40),
                            )),
                      ),
                    ],
                  )),
            ],
          ),
        )
      ],
    );
  }
}
