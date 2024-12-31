import 'package:calculator/dialogBox.dart';
import 'package:calculator/landscape.dart';
import 'package:calculator/portrait.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main(List<String> args) {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var scrollController = ScrollController();

    var mqSize = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: 
          
           Center(child: OrientationBuilder(
            builder: (context, orientation) {
              return orientation == Orientation.portrait
                  ? const PortraitCalculator()
                  : const LandscapeCalculator();
            },
          ))
    );
  }
}
