import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final List<String> images =[
    'assets/images/toko1.png'
    'assets/images/toko2.png'
    'assets/images/toko3.png'
    'assets/images/toko4.png'
    'assets/images/toko5.png'
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(20),
          child: Text("HOME",
          style: TextStyle(
            color: Colors.purple[700],
            fontWeight: FontWeight.bold,

          ),),
          )
        ],
      ),
    );
  }
}