import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stocks_app/constants.dart';
import 'package:stocks_app/namelist.dart';

Map<int, int> used = {};

class CollectionBlock extends StatelessWidget {
  final String title;
  final String des;
  final double growth;

  CollectionBlock(
      {Key? key, required this.title, required this.des, required this.growth})
      : super(key: key);

  List<Widget> overlap(List<String> x) {
    int overlaps = 30;
    return List<Widget>.generate(
        x.length,
        (index) => Padding(
              padding: EdgeInsets.only(left: index.toDouble() * overlaps),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                foregroundImage: NetworkImage(x[index]),
              ),
            ));
  }

  List<String> generate() {
    Random ran = Random();
    List<String> li = [];
    Map<int, int> used1 = {};
    for (var i = 0; i < 4; i++) {
      int ranint = ran.nextInt(f.length);
      while (used1[ranint] == 1) {
        ranint = ran.nextInt(f.length);
      }
      li.add("https://eodhistoricaldata.com/img/logos/US/${f[ranint]}.png");
      used1[ranint] = 1;
    }
    return li;
  }

  Color randColor() {
    List<Color> coll = [
      Color.fromARGB(255, 15, 15, 15),
      Color.fromARGB(255, 173, 7, 7),
      Color.fromARGB(255, 104, 73, 245),
      Color.fromARGB(255, 128, 235, 6),
      Color.fromARGB(255, 172, 184, 7),
      Color.fromARGB(255, 223, 148, 10)
    ];
    Random ran = Random();
    int ranint = ran.nextInt(coll.length);

    while (used[ranint] == 1) {
      ranint = ran.nextInt(coll.length);
    }
    used[ranint] = 1;
    return coll[ranint];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 8, bottom: 12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: randColor(),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(3.0, 5.0), // shadow direction: bottom right
            )
          ],
        ),
        height: 160,
        width: 350,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: colheadstyle,
              ),
              Text(
                des,
                style: coldesstyle,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "+$growth%",
                      style: colgrowthstyle,
                    ),
                    Stack(
                      children: overlap(generate()),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
