import 'package:flutter/material.dart';
import 'package:flutter_hot_line/data/hotline.dart';
import 'package:flutter_hot_line/data/views/sub_home_ui.dart';

class SubDHomeUi extends StatefulWidget {
  const SubDHomeUi({super.key});

  @override
  State<SubDHomeUi> createState() => _SubDHomeUiState();
}

class _SubDHomeUiState extends State<SubDHomeUi> {
  @override
  Widget build(BuildContext context) {
    return SubHomeUI(
      categoryTitle: "สาธารณูปโภค",
      hotlineList: HotlineData.utilityHotlines,
      themeColor: Colors.brown,
      onInfoPressed: () {
        Navigator.pushNamed(context, '/about');
      },
    );
  }
}
