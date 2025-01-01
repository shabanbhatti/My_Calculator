import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void noHistoryDialogBox({required var context}) {
  showCupertinoDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
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
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.note,
                color: Colors.white,
              ),
              Text(
                'No history found',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Ok'))
              ],
            )
          ],
        );
      });
}
