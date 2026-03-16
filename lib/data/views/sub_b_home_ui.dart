import 'package:flutter/material.dart';
import 'package:flutter_hot_line/data/hotline.dart';
import 'package:flutter_hot_line/data/views/sub_home_ui.dart';

class SubBHomeUi extends StatefulWidget {
  const SubBHomeUi({super.key});

  @override
  State<SubBHomeUi> createState() => _SubBHomeUiState();
}

class _SubBHomeUiState extends State<SubBHomeUi> {
  @override
  Widget build(BuildContext context) {
    return SubHomeUI(
      categoryTitle: "อุบัติเหตุ - เหตุฉุกเฉิน",
      hotlineList: HotlineData.emergencyHotlines,
      themeColor: Colors.redAccent,
      onInfoPressed: () => Navigator.pushNamed(context, '/about'),
    );
  }
}
