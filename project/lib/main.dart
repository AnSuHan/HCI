import 'package:flutter/material.dart';

Run|Debug|Profile
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backroundColor: kWightColor,
        body: const HomePage(),
      ), //Scaffold
    ); // MaterialApp
  }
}

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(); // Container
  }
}