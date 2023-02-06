import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//blue background, white text color
var selectedButton = ElevatedButton.styleFrom(
    backgroundColor: const Color(0XFF1DA1F2),
    shadowColor: Colors.transparent,
    foregroundColor: Colors.white,
    elevation: 0.0,
    textStyle: const TextStyle(
        fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500));

//baby blue background, black text color
var unSelectedButton = ElevatedButton.styleFrom(
    backgroundColor: const Color(0XFFEDF8FF),
    shadowColor: Colors.transparent,
    foregroundColor:const Color(0XFF1DA1F2),
    elevation: 0.0,
    textStyle: const TextStyle(
        fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500));

var withandWithoutpreset = ElevatedButton.styleFrom(
    backgroundColor: const Color(0XFF1DA1F2),
    fixedSize: Size(396, 50),
    shadowColor: Colors.transparent,
    foregroundColor: Colors.white,
    elevation: 0.0,
    textStyle: const TextStyle(
        fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500));

var titleText = TextStyle(
  fontSize: 18.sp,
  fontWeight: FontWeight.w500,
);
