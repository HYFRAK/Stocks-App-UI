import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stocks_app/constants.dart';
import 'package:stocks_app/namelist.dart';

class RecommendedBlock extends StatelessWidget {
  final String sym;
  const RecommendedBlock({Key? key, required this.sym}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Random ran = Random();
    double p = ran.nextDouble() * 2 * ran.nextInt(2000) + 1;
    String price = p.toStringAsPrecision(6);

    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        height: 75,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Colors.grey.withAlpha(40)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.white,
                  foregroundImage: NetworkImage(
                    "https://eodhistoricaldata.com/img/logos/US/$sym.png",
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  stockmap[sym].toString().split(" ")[0],
                  style: recomname,
                ),
              ],
            ),
            Text(
              "\$$price",
              style: recomname.copyWith(fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
