import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main(List<String> args) {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var scrollController = ScrollController();
  int myTextLenght = 20;
  String myText = '';

  String zeroNumber = '0';

  String answer = '';

  var isTrue = true;

  String elseString = '';

  @override
  Widget build(BuildContext context) {
    void myDialogBox() {
      showCupertinoDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              alignment: Alignment.center,
              backgroundColor:
                  const Color.fromARGB(255, 255, 255, 255).withOpacity(0.95),
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.warning,
                    color: Colors.red,
                    size: 50,
                  ),
                  Text(
                    'Wait',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              content: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'This feature will be add later!',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.orange)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child:
                        const Text('Ok', style: TextStyle(color: Colors.white)))
              ],
            );
          });
    }

    var scrollController = ScrollController();

// scrollController.jumpTo(scrollController.position.maxScrollExtent);

    var mqSize = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            toolbarHeight: mqSize.height * 0.005,
            backgroundColor: Colors.orange,
          ),
          backgroundColor: Colors.black,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: mqSize.height * 0.1,
                ),
                SizedBox(
                  height: mqSize.height * 0.1,
                  width: mqSize.width * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                          child: (isTrue == false)
                              ? Flexible(
                                  child: FittedBox(
                                    child: Text(
                                      answer,
                                      style: const TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 30,
                                          color: Color.fromARGB(
                                              255, 152, 152, 152)),
                                    ),
                                  ),
                                )
                              : const Text(''))
                    ],
                  ),
                ),
                SizedBox(
                  height: mqSize.height * 0.12,
                  width: mqSize.width * 0.8,
                  child: SingleChildScrollView(
                    controller: scrollController,
                    reverse: false,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          myText == '' ? zeroNumber : myText,
                          style: const TextStyle(
                              fontSize: 55, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),

                // --------------------------------------------------------------------------
                SizedBox(
                    height: mqSize.height * 0.08,
                    width: mqSize.width * 0.95,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: mqSize.height * 0.08,
                          width: mqSize.width * 0.17,
                          child: FloatingActionButton(
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
                                  myText =
                                      myText.substring(0, myText.length - 1);
                                } else {
                                  myText = '';
                                  answer.isEmpty;
                                }
                              });
                            },
                            child: FittedBox(
                              child: (isTrue == true)
                                  ? const Icon(Icons.backspace,
                                      color: Colors.red, size: 30)
                                  : const Text(
                                      'AC',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: mqSize.height * 0.08,
                          width: mqSize.width * 0.17,
                          child: FloatingActionButton(
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
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                        SizedBox(
                          height: mqSize.height * 0.08,
                          width: mqSize.width * 0.17,
                          child: FloatingActionButton(
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
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ))),
                        ),
                        SizedBox(
                          height: mqSize.height * 0.08,
                          width: mqSize.width * 0.17,
                          child: FloatingActionButton(
                              backgroundColor: Colors.orange,
                              onPressed: () {
                                setState(() {
                                  if (isTrue == false) {
                                    isTrue = true;
                                  }
                                  myText += "/";
                                });
                              },
                              child: const FittedBox(
                                  child: Text(
                                '÷',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              ))),
                        ),
                      ],
                    )),

                // --------------------------------------------------------------------------
                // --------------------------------------------------------------------------
                // --------------------------------------------------------------------------

                // --------------------------------------------------------------------------
                SizedBox(
                    height: mqSize.height * 0.08,
                    width: mqSize.width * 0.95,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: mqSize.height * 0.08,
                          width: mqSize.width * 0.17,
                          child: FloatingActionButton(
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 30),
                            )),
                          ),
                        ),
                        SizedBox(
                          height: mqSize.height * 0.08,
                          width: mqSize.width * 0.17,
                          child: FloatingActionButton(
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 30),
                            )),
                          ),
                        ),
                        SizedBox(
                          height: mqSize.height * 0.08,
                          width: mqSize.width * 0.17,
                          child: FloatingActionButton(
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
                                    color: Colors.black, fontSize: 30),
                              ))),
                        ),
                        SizedBox(
                          height: mqSize.height * 0.08,
                          width: mqSize.width * 0.17,
                          child: FloatingActionButton(
                              backgroundColor: Colors.orange,
                              onPressed: () {
                                setState(() {
                                  if (isTrue == false) {
                                    isTrue = true;
                                  }
                                  myText += '*';
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
                    height: mqSize.height * 0.08,
                    width: mqSize.width * 0.95,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: mqSize.height * 0.08,
                          width: mqSize.width * 0.17,
                          child: FloatingActionButton(
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 30),
                            )),
                          ),
                        ),
                        SizedBox(
                          height: mqSize.height * 0.08,
                          width: mqSize.width * 0.17,
                          child: FloatingActionButton(
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 30),
                            )),
                          ),
                        ),
                        SizedBox(
                          height: mqSize.height * 0.08,
                          width: mqSize.width * 0.17,
                          child: FloatingActionButton(
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
                                    color: Colors.black, fontSize: 30),
                              ))),
                        ),
                        SizedBox(
                          height: mqSize.height * 0.08,
                          width: mqSize.width * 0.17,
                          child: FloatingActionButton(
                              backgroundColor: Colors.orange,
                              onPressed: () {
                                setState(() {
                                  if (isTrue == false) {
                                    isTrue = true;
                                  }
                                  myText += "-";
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
                    height: mqSize.height * 0.08,
                    width: mqSize.width * 0.95,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: mqSize.height * 0.08,
                          width: mqSize.width * 0.17,
                          child: FloatingActionButton(
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 30),
                            )),
                          ),
                        ),
                        SizedBox(
                          height: mqSize.height * 0.08,
                          width: mqSize.width * 0.17,
                          child: FloatingActionButton(
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 30),
                            )),
                          ),
                        ),
                        SizedBox(
                          height: mqSize.height * 0.08,
                          width: mqSize.width * 0.17,
                          child: FloatingActionButton(
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
                                    color: Colors.black, fontSize: 30),
                              ))),
                        ),
                        SizedBox(
                          height: mqSize.height * 0.08,
                          width: mqSize.width * 0.17,
                          child: FloatingActionButton(
                              backgroundColor: Colors.orange,
                              onPressed: () {
                                setState(() {
                                  if (isTrue == false) {
                                    isTrue = true;
                                  }
                                  myText += '+';
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
                    height: mqSize.height * 0.08,
                    width: mqSize.width * 0.95,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: mqSize.height * 0.08,
                          width: mqSize.width * 0.17,
                          child: FloatingActionButton(
                            backgroundColor: Colors.orange,
                            onPressed: myDialogBox,
                            child: const FittedBox(
                              child: Icon(Icons.settings,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  size: 40),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: mqSize.height * 0.08,
                          width: mqSize.width * 0.17,
                          child: FloatingActionButton(
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
                                  color: Color.fromARGB(255, 209, 0, 0),
                                  size: 40),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: mqSize.height * 0.08,
                          width: mqSize.width * 0.17,
                          child: FloatingActionButton(
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
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    size: 10),
                              )),
                        ),
                        SizedBox(
                          height: mqSize.height * 0.08,
                          width: mqSize.width * 0.17,
                          child: FloatingActionButton(
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
          )),
    );
  }
}
