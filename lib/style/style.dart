import 'package:flutter/material.dart';

const Color primaryColor = Colors.blue;
const Color primaryDarkColor = Colors.black;
const Color primaryListColor = Colors.transparent;

const double standardText = 18.0;
const double largeText = 18.0;

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

// Random pop up texts of whatever text is inputted within Text (****)
void snackBar(BuildContext context, String text) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));

InputDecoration inputStyling(String labelText, {hintText}) =>
    InputDecoration(labelText: labelText, hintText: hintText); 
  
  //return InputDecoration(labelText: labelText); //"Email");

