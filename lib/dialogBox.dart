import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

 void myDialogBox({required var context}) {
      showCupertinoDialog(
        barrierDismissible: true,
        
          context: context,
          builder: (context) {
            return AlertDialog(
              alignment: Alignment.center,
              
              backgroundColor:
                  const Color.fromARGB(255, 62, 62, 62),
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
                        backgroundColor: WidgetStatePropertyAll(Colors.white)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child:
                        const Text('Ok', style: TextStyle(color: Colors.black)))
              ],
            );
          });
    }
