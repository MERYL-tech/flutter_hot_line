import 'package:flutter/material.dart';
import 'package:flutter_hot_line/data/views/about_ui.dart';
import 'package:flutter_hot_line/data/views/home_ui.dart';
import 'package:flutter_hot_line/data/views/splassh_screen_ui.dart';
import 'package:flutter_hot_line/data/views/sub_a_home_ui.dart';
import 'package:flutter_hot_line/data/views/sub_b_home_ui.dart';
import 'package:flutter_hot_line/data/views/sub_c_home_ui.dart';
import 'package:flutter_hot_line/data/views/sub_d_home_ui.dart';

import 'package:google_fonts/google_fonts.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FlutterHotLineApp(),
  );
}

class FlutterHotLineApp extends StatefulWidget {
  const FlutterHotLineApp({super.key});

  @override
  State<FlutterHotLineApp> createState() => _FlutterHotLineAppState();
}

class _FlutterHotLineAppState extends State<FlutterHotLineApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Thai Hotline App',
      home: SplasshScreenUi(),
      theme: ThemeData(
        textTheme: GoogleFonts.notoSansThaiTextTheme(
          Theme.of(context).textTheme,
      ),
      ),
      initialRoute: '/',
      routes: {
      '/about': (context) => const AboutUi(),
        '/sub_a': (context) => const SubAHomeUI(),
        '/sub_b': (context) => const SubBHomeUi(),
        '/sub_c': (context) => const SubCHomeUi(),
        '/sub_d': (context) => const SubDHomeUi(),
      },


    );
  }
}