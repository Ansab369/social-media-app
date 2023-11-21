import 'package:flutter/material.dart';

// --------- COLOR ----------
const Color kBlueColor = Color.fromARGB(255, 16, 73, 119);
const Color kWhiteColor = Colors.white;
const Color kGreyColor = Colors.grey;
const Color kLightBlueColor = Color.fromARGB(51, 16, 73, 119);

//--------BUTTON STYLE --------

// filled Button Style
final mainButtonStyle = TextButton.styleFrom(
  minimumSize: const Size(double.infinity, 40),
  foregroundColor: Colors.white,
  backgroundColor: kBlueColor,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
);
// outline Button Style
final mainOutlineButtonStyle = TextButton.styleFrom(
  minimumSize: const Size(double.infinity, 40),
  foregroundColor: Colors.black,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    side: const BorderSide(
      color: kBlueColor,
      width: 2,
    ),
  ),
);