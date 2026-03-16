// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hot_line/data/views/about_ui.dart';
import 'package:flutter_hot_line/data/views/home_ui.dart';
import 'package:flutter_hot_line/data/views/intro_ui.dart';

class SplasshScreenUi extends StatefulWidget {
  const SplasshScreenUi({super.key});

  @override
  State<SplasshScreenUi> createState() => _SplasshScreenUiState();
}

class _SplasshScreenUiState extends State<SplasshScreenUi> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => IntroUi(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/SOS.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 400),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'THAI ',
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: 'HOT ',
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 252, 227, 3),
                      ),
                    ),
                    TextSpan(
                      text: 'LINE',
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'สายด่วน ติดต่อเบอร์ฉุกเฉิน',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellowAccent,
                ),
              ),
              SizedBox(height: 20),
              CircularProgressIndicator(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
