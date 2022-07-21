import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: BoxDecoration(color: Colors.grey.withAlpha(30)),
      child: Row(
        children: [
          Icon(Icons.pie_chart),
          Icon(Icons.switch_access_shortcut),
          Icon(Icons.person)
        ],
      ),
    );
  }
}
