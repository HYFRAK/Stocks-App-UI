import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stocks_app/constants.dart';
import 'package:stocks_app/namelist.dart';

class FavBlock extends StatelessWidget {
  final String sym;
  const FavBlock({Key? key, required this.sym}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Random ran = Random();
    double g = ran.nextDouble() * 6 + 1.1;
    String growth = g.toStringAsPrecision(2);
    double p = ran.nextDouble() * 2 * ran.nextInt(200) + 1;
    String price = p.toStringAsPrecision(6);
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 5),
      child: Container(
        height: 160,
        width: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            border: Border.all(color: Colors.grey)),
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: NetworkImage(
                  "https://eodhistoricaldata.com/img/logos/US/$sym.png",
                ),
                width: 38,
                height: 38,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                stockmap[sym].toString().split(" ")[0],
                style: favstyle,
              ),
              Row(
                children: [
                  Text(
                    "\$$price",
                    style:
                        coldesstyle.copyWith(color: Colors.black, fontSize: 17),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "+$growth%",
                    style: favgrowthstyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
