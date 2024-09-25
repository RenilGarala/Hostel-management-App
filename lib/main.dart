import 'package:flutter/material.dart';
import 'package:hostel_management/Home.dart';
import 'package:hostel_management/Login.dart';
import 'package:hostel_management/Profile.dart';
import 'package:hostel_management/Ragister.dart';
import 'package:hostel_management/Room.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}