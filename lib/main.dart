import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leave_app/Screens/Dashboard.dart';
import 'package:leave_app/Screens/Login.dart';
import 'package:leave_app/Screens/form.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

  void main(){
 
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Employee leave App",
    home:  LoginScreen(),
  )
  );
}

