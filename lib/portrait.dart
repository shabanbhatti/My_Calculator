import 'dart:async';

import 'package:calculator/dialogBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class PortraitCalculator extends StatefulWidget {
  const PortraitCalculator({super.key});

  @override
  State<PortraitCalculator> createState() => _PortraitCalculatorState();
}

class _PortraitCalculatorState extends State<PortraitCalculator> {
  var scrollController = ScrollController();
  int myTextLenght = 20;
  String originalText = '';
  String fakeText = '';

  String zeroNumber = '0';

  String fakeAnswer = '';
  String originalAnswer = '';

  var isTrue = true;

  String elseString = '';
  List<String> myList = <String>[];
  bool isListTrue = true;

  @override
  Widget build(BuildContext context) {
//-----------------Show Dialog Box

    void myDialogBox({required var context}) {
      setState(() {
        showCupertinoDialog(
            barrierDismissible: true,
            context: context,
            builder: (context) {
              return AlertDialog(
                scrollable: true,
                alignment: Alignment.center,
                backgroundColor: const Color.fromARGB(255, 62, 62, 62),
                title: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'History',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                content: Container(
                  height: 200,
                  width: 200,
                  child: ListView(
                    children: myList.map((item) {
                      return ListTile(
                          title: Text(
                        item.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ));
                    }).toList(),
                  ),
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              myList.clear();
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text('Clear history'))
                    ],
                  )
                ],
              );
            });
      });
    }

    // -------------------------------_END----------------------------

    var mqSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: mqSize.height * 0.17),
        
            SizedBox(
              height: mqSize.height * 0.05,
              width: mqSize.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isTrue == false) {
                          originalText = originalAnswer;
                          fakeText = fakeAnswer;
                          originalAnswer = '';
                          fakeAnswer = '';
                          isTrue = true;
                        }
                      });
                    },
                    child: Flexible(
                        child: (isTrue == false)
                            ? FittedBox(
                                child: Text(
                                  fakeAnswer,
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 30,
                                      color: Color.fromARGB(255, 152, 152, 152)),
                                ),
                              )
                            : const Text('')),
                  )
                ],
              ),
            ),
            SizedBox(
              height: mqSize.height * 0.12,
              width: mqSize.width * 0.93,
              child: Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: FittedBox(
                        child: Text(
                          originalText == ''
                              ? zeroNumber
                              : fakeText.characters.take(25).toString(),
                          style: TextStyle(
                            fontSize: 65,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
        
            // --------------------------------------------------------------------------
            Center(
              child: SizedBox(
                height: mqSize.height * 0.54,
                width: mqSize.width * 0.95,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: SizedBox(
                          height: mqSize.height * 0.1,
                          width: mqSize.width * 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                child: SizedBox(
                                  height: mqSize.height * 0.24,
                                  width: mqSize.width * 0.22,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                          Colors.white.withOpacity(0.4),
                                        ),
                                        shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                        ),
                                        splashFactory: InkRipple.splashFactory,
                                        overlayColor: WidgetStatePropertyAll(
                                          Colors.white.withOpacity(0.1),
                                        )),
                                    onLongPress: () {
                                      setState(() {
                                        fakeText = '';
                                        originalText = '';
                                        isTrue = true;
                                      });
                                    },
                                    onPressed: () {
                                      setState(() {
                                        if (isTrue == false) {
                                          isTrue = true;
                                          fakeText = '';
                                          originalText = '';
                                        }
        
                                        if (isTrue == true &&
                                                originalText.isNotEmpty) {
        
                                          fakeText = fakeText.substring(
                                              0, fakeText.length - 1);
                                          originalText = originalText.substring(
                                              0, originalText.length - 1);
                                            fakeAnswer='';
                                            originalAnswer='';
                                             
                                          
                                        } else {
                                          fakeText = '';
                                          originalText = '';
                                          fakeAnswer.isEmpty;
                                          originalAnswer.isEmpty;
                                        }
                                      });
                                    },
                                    child: Flexible(
                                      child: FittedBox(
                                        child: (isTrue == true &&
                                                originalText.isNotEmpty)
                                            ? const Icon(Icons.backspace,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                size: 30)
                                            : const Text(
                                                'AC',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: SizedBox(
                                  height: mqSize.height * 0.24,
                                  width: mqSize.width * 0.22,
                                  child: FloatingActionButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50)),
                                    backgroundColor:
                                        Colors.white.withOpacity(0.4),
                                    splashColor: Colors.white.withOpacity(0.5),
                                    onPressed: () {
                                      setState(() {
                                        if (isTrue == false) {
                                          isTrue = true;
                                        }
                                        originalText += '(';
                                        fakeText += '(';
                                      });
                                    },
                                    child: Flexible(
                                      child: const FittedBox(
                                          child: Text(
                                        '(',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: SizedBox(
                                  height: mqSize.height * 0.24,
                                  width: mqSize.width * 0.22,
                                  child: FloatingActionButton(
                                      splashColor: Colors.white.withOpacity(0.5),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      backgroundColor:
                                          Colors.white.withOpacity(0.4),
                                      onPressed: () {
                                        setState(() {
                                          if (isTrue == false) {
                                            isTrue = true;
                                          }
        
                                          if (originalText.isNotEmpty) {
                                            originalText += ')';
                                            fakeText += ')';
                                          }
                                        });
                                      },
                                      child: Flexible(
                                        child: const FittedBox(
                                            child: Text(
                                          ')',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        )),
                                      )),
                                ),
                              ),
                              Flexible(
                                child: SizedBox(
                                  height: mqSize.height * 0.24,
                                  width: mqSize.width * 0.22,
                                  child: FloatingActionButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      splashColor: Colors.white.withOpacity(0.5),
                                      backgroundColor: Colors.orange,
                                      onPressed: () {
                                        setState(() {
                                          if (isTrue == false) {
                                            isTrue = true;
                                          }
                                          if (originalText.isNotEmpty) {
                                            originalText += '/';
                                            fakeText += '÷';
                                          }
                                        });
                                      },
                                      child: Flexible(
                                        child: const FittedBox(
                                            child: Text(
                                          '÷',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontSize: 40,
                                          ),
                                        )),
                                      )),
                                ),
                              ),
                            ],
                          )),
                    ),
        
                    // --------------------------------------------------------------------------
                    // --------------------------------------------------------------------------
                    // --------------------------------------------------------------------------
        
                    // --------------------------------------------------------------------------
                    Flexible(
                      child: SizedBox(
                          height: mqSize.height * 0.1,
                          width: mqSize.width * 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                child: SizedBox(
                                  height: mqSize.height * 0.24,
                                  width: mqSize.width * 0.22,
                                  child: FloatingActionButton(
                                    splashColor: Colors.white.withOpacity(0.5),
                                    backgroundColor:
                                        Colors.white.withOpacity(0.12),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50)),
                                    onPressed: () {
                                      setState(() {
                                        if (isTrue == false) {
                                          isTrue = true;
                                          originalText = '';
                                          fakeText = '';
                                        }
                                        fakeAnswer = '';
                                        originalAnswer = '';
                                        fakeText = "${fakeText}7";
                                        originalText = "${originalText}7";
                                      });
                                    },
                                    child: Flexible(
                                      child: const FittedBox(
                                          child: Text(
                                        '7',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontSize: 30),
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: SizedBox(
                                  height: mqSize.height * 0.24,
                                  width: mqSize.width * 0.22,
                                  child: FloatingActionButton(
                                    splashColor: Colors.white.withOpacity(0.5),
                                    backgroundColor:
                                        Colors.white.withOpacity(0.12),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50)),
                                    onPressed: () {
                                      setState(() {
                                        if (isTrue == false) {
                                          isTrue = true;
                                          originalText = '';
                                          fakeText = '';
                                        }
                                        fakeAnswer = '';
                                        originalAnswer = '';
                                        originalText = "${originalText}8";
                                        fakeText = "${fakeText}8";
                                      });
                                    },
                                    child: Flexible(
                                      child: const FittedBox(
                                          child: Text(
                                        '8',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontSize: 30),
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: SizedBox(
                                  height: mqSize.height * 0.24,
                                  width: mqSize.width * 0.22,
                                  child: FloatingActionButton(
                                      splashColor: Colors.white.withOpacity(0.5),
                                      backgroundColor:
                                          Colors.white.withOpacity(0.12),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      onPressed: () {
                                        setState(() {
                                          if (isTrue == false) {
                                            isTrue = true;
                                            fakeText = '';
                                            originalText = '';
                                          }
                                          fakeAnswer = '';
                                          originalText = "${originalText}9";
                                          fakeText = "${fakeText}9";
                                        });
                                      },
                                      child: Flexible(
                                        child: const FittedBox(
                                            child: Text(
                                          '9',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: 30),
                                        )),
                                      )),
                                ),
                              ),
                              Flexible(
                                child: SizedBox(
                                  height: mqSize.height * 0.24,
                                  width: mqSize.width * 0.22,
                                  child: FloatingActionButton(
                                      splashColor: Colors.white.withOpacity(0.5),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      backgroundColor: Colors.orange,
                                      onPressed: () {
                                        setState(() {
                                          if (isTrue == false) {
                                            isTrue = true;
                                          }
                                          if (originalText.isNotEmpty) {
                                            fakeText += '×';
                                            originalText += '*';
                                          }
                                        });
                                      },
                                      child: Flexible(
                                        child: const FittedBox(
                                          child: Icon(
                                            Icons.close,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            size: 40,
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                            ],
                          )),
                    ),
                    // // --------------------------------------------------------------------------
                    Flexible(
                      child: SizedBox(
                          height: mqSize.height * 0.1,
                          width: mqSize.width * 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                child: SizedBox(
                                  height: mqSize.height * 0.24,
                                  width: mqSize.width * 0.22,
                                  child: FloatingActionButton(
                                    splashColor: Colors.white.withOpacity(0.5),
                                    backgroundColor:
                                        Colors.white.withOpacity(0.12),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50)),
                                    onPressed: () {
                                      setState(() {
                                        if (isTrue == false) {
                                          isTrue = true;
                                          fakeText = '';
                                          originalText = '';
                                        }
                                        fakeAnswer = '';
                                        originalText = "${originalText}4";
                                        fakeText = "${fakeText}4";
                                      });
                                    },
                                    child: Flexible(
                                      child: const FittedBox(
                                          child: Text(
                                        '4',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontSize: 30),
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: SizedBox(
                                  height: mqSize.height * 0.24,
                                  width: mqSize.width * 0.22,
                                  child: FloatingActionButton(
                                    splashColor: Colors.white.withOpacity(0.5),
                                    backgroundColor:
                                        Colors.white.withOpacity(0.12),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50)),
                                    onPressed: () {
                                      setState(() {
                                        if (isTrue == false) {
                                          isTrue = true;
                                          fakeText = '';
                                          originalText = '';
                                        }
                                        fakeAnswer = '';
                                        originalText = "${originalText}5";
                                        fakeText = "${fakeText}5";
                                      });
                                    },
                                    child: Flexible(
                                      child: const FittedBox(
                                          child: Text(
                                        '5',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontSize: 30),
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: SizedBox(
                                  height: mqSize.height * 0.24,
                                  width: mqSize.width * 0.22,
                                  child: FloatingActionButton(
                                      splashColor: Colors.white.withOpacity(0.5),
                                      backgroundColor:
                                          Colors.white.withOpacity(0.12),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      onPressed: () {
                                        setState(() {
                                          if (isTrue == false) {
                                            isTrue = true;
                                            fakeText = '';
                                            originalText = '';
                                          }
                                          fakeAnswer = '';
                                          originalText = "${originalText}6";
                                          fakeText = "${fakeText}6";
                                        });
                                      },
                                      child: Flexible(
                                        child: const FittedBox(
                                            child: Text(
                                          '6',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: 30),
                                        )),
                                      )),
                                ),
                              ),
                              Flexible(
                                child: SizedBox(
                                  height: mqSize.height * 0.24,
                                  width: mqSize.width * 0.22,
                                  child: FloatingActionButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      splashColor: Colors.white.withOpacity(0.5),
                                      backgroundColor: Colors.orange,
                                      onPressed: () {
                                        setState(() {
                                          if (isTrue == false) {
                                            isTrue = true;
                                          }
        
                                          originalText += '-';
                                          fakeText += '−';
                                        });
                                      },
                                      child: Flexible(
                                        child: const FittedBox(
                                          child: Icon(Icons.remove,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              size: 40),
                                        ),
                                      )),
                                ),
                              ),
                            ],
                          )),
                    ),
                    // ---------------------------------------------------------------------------------
                    Flexible(
                      child: SizedBox(
                          height: mqSize.height * 0.1,
                          width: mqSize.width * 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                child: SizedBox(
                                  height: mqSize.height * 0.24,
                                  width: mqSize.width * 0.22,
                                  child: FloatingActionButton(
                                    splashColor: Colors.white.withOpacity(0.5),
                                    backgroundColor:
                                        Colors.white.withOpacity(0.12),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50)),
                                    onPressed: () {
                                      setState(() {
                                        if (isTrue == false) {
                                          isTrue = true;
                                          fakeText = '';
                                          originalText = '';
                                        }
                                        fakeAnswer = '';
                                        originalText = "${originalText}1";
                                        fakeText = "${fakeText}1";
                                      });
                                    },
                                    child: Flexible(
                                      child: const FittedBox(
                                          child: Text(
                                        '1',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontSize: 30),
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: SizedBox(
                                  height: mqSize.height * 0.24,
                                  width: mqSize.width * 0.22,
                                  child: FloatingActionButton(
                                    splashColor: Colors.white.withOpacity(0.5),
                                    backgroundColor:
                                        Colors.white.withOpacity(0.12),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50)),
                                    onPressed: () {
                                      setState(() {
                                        if (isTrue == false) {
                                          isTrue = true;
                                          fakeText = '';
                                          originalText = '';
                                        }
                                        fakeAnswer = '';
                                        originalText = "${originalText}2";
                                        fakeText = "${fakeText}2";
                                      });
                                    },
                                    child: Flexible(
                                      child: const FittedBox(
                                          child: Text(
                                        '2',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontSize: 30),
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: SizedBox(
                                  height: mqSize.height * 0.24,
                                  width: mqSize.width * 0.22,
                                  child: FloatingActionButton(
                                      splashColor: Colors.white.withOpacity(0.5),
                                      backgroundColor:
                                          Colors.white.withOpacity(0.12),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      onPressed: () {
                                        setState(() {
                                          if (isTrue == false) {
                                            isTrue = true;
                                            fakeText = '';
                                            originalText = '';
                                          }
                                          fakeAnswer = '';
                                          originalText = "${originalText}3";
                                          fakeText = "${fakeText}3";
                                        });
                                      },
                                      child: Flexible(
                                        child: const FittedBox(
                                            child: Text(
                                          '3',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: 30),
                                        )),
                                      )),
                                ),
                              ),
                              Flexible(
                                child: SizedBox(
                                  height: mqSize.height * 0.24,
                                  width: mqSize.width * 0.22,
                                  child: FloatingActionButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      splashColor: Colors.white.withOpacity(0.5),
                                      backgroundColor: Colors.orange,
                                      onPressed: () {
                                        setState(() {
                                          if (isTrue == false) {
                                            isTrue = true;
                                          }
                                          if (originalText.isNotEmpty) {
                                            originalText += '+';
                                            fakeText += '+';
                                          }
                                        });
                                      },
                                      child: Flexible(
                                        child: const FittedBox(
                                          child: Icon(Icons.add,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              size: 40),
                                        ),
                                      )),
                                ),
                              ),
                            ],
                          )),
                    ),
        
                    // ----------------------------------------------------------------------------------
                    Flexible(
                      child: SizedBox(
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
                                    myList.isEmpty
                                        ? noHistoryDialogBox(context: context)
                                        : myDialogBox(context: context);
                                  },
                                  child: Flexible(
                                    child: const FittedBox(
                                      child: Text(
                                        'History',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontSize: 17),
                                      ),
                                    ),
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
                                        fakeText = '';
                                        originalText = '';
                                      }
                                      fakeAnswer = '';
                                      originalText = "${originalText}0";
                                      fakeText = "${fakeText}0";
                                    });
                                  },
                                  child: Flexible(
                                    child: const FittedBox(
                                      child: Icon(Icons.exposure_zero,
                                          color:
                                              Color.fromARGB(255, 255, 255, 255),
                                          size: 40),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: SizedBox(
                                  height: mqSize.height * 0.24,
                                  width: mqSize.width * 0.22,
                                  child: FloatingActionButton(
                                      splashColor: Colors.white.withOpacity(0.5),
                                      backgroundColor:
                                          Colors.white.withOpacity(0.12),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      onPressed: () {
                                        if (isTrue == false) {
                                          isTrue = true;
                                        }
                                        setState(() {
                                          if (isTrue == false) {
                                            isTrue = true;
                                          }
                                          if (originalText.isNotEmpty) {
                                            originalText += '.';
                                            fakeText += '.';
                                          }
                                        });
                                      },
                                      child: Flexible(
                                        child: const FittedBox(
                                          child: Icon(Icons.fiber_manual_record,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              size: 10),
                                        ),
                                      )),
                                ),
                              ),
                              Flexible(
                                child: SizedBox(
                                  height: mqSize.height * 0.24,
                                  width: mqSize.width * 0.22,
                                  child: FloatingActionButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      splashColor: Colors.white.withOpacity(0.5),
                                      backgroundColor: Colors.orange,
                                      onPressed: () {
                                        if (fakeAnswer == '' &&
                                                originalText.contains('*') ||
                                            originalText.contains('+') ||
                                            originalText.contains('-') ||
                                            originalText.contains('/')) {
                                          try {
                                            Parser p = Parser();
                                            fakeAnswer = fakeText;
                                            originalAnswer = originalText;
                                            Expression exp = p.parse(originalText);
                                            ContextModel cm = ContextModel();
                                            num result = exp.evaluate(
                                                EvaluationType.REAL, cm);
        
                                            setState(() {
                                              isTrue = false;
        
                                              if (originalText.contains('.') ||
                                                  originalText.contains('/')) {
                                                fakeText =
                                                    result.toStringAsFixed(4);
                                              } else {
                                                fakeText =
                                                    result.toInt().toString();
                                              }
                                              myList.add('$fakeAnswer = ${fakeText}');
        
                                              print(myList);
                                            });
                                          } catch (e) {
                                            setState(() {
                                              print(e);
                                            });
                                          }
                                        }
                                      },
                                      child: Flexible(
                                        child: const FittedBox(
                                          child: Icon(Icons.drag_handle,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              size: 40),
                                        ),
                                      )),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
