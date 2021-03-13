import "package:flutter/material.dart";
import "dart:ui";
void main(){

  runApp(
      MaterialApp(
          home: Material(
            color: Colors.yellow,
            child: Center(
              child: Text(
                  "18IT099: Hello world How are you?",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(color: Colors.green, fontSize:20.0)
              ),
            ),
          )
      )
  );
}