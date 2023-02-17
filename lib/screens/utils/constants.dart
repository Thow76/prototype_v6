import 'package:flutter/material.dart';

const textInputDecorationLight = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
      borderSide: BorderSide(color: Colors.white),
    ),
    filled: true,
    fillColor: Color.fromARGB(255, 57, 50, 91),
    hintStyle: TextStyle(color: Colors.white),
    labelStyle: TextStyle(color: Colors.white),
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    contentPadding: EdgeInsets.all(20));
