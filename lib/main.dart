import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stocks_app/collection_block.dart';
import 'package:stocks_app/constants.dart';
import 'package:stocks_app/favorite_block.dart';
import 'package:stocks_app/namelist.dart';
import 'package:stocks_app/recommended_block.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  BorderRadius rad = BorderRadius.all(Radius.circular(12));
  Color grey1 = Colors.grey.withAlpha(40);
  int maxlen = f.length;

  List<Widget> overlap(List x) {
    int overlaps = 30;
    return List<Widget>.generate(
        x.length,
        (index) => Padding(
              padding: EdgeInsets.only(left: index.toDouble() * overlaps),
              child: x[index],
            ));
  }

  List<Widget> generate_fav(int e) {
    Random ran = Random();
    List<Widget> z = [];

    for (var i = 0; i < e; i++) {
      int ranint = ran.nextInt(f.length);
      FavBlock r = new FavBlock(sym: f[ranint]);

      z.add(r);
    }

    return z;
  }

  List<Widget> generate_rec(int e) {
    Random ran = Random();
    List<Widget> z = [];

    for (var i = 0; i < e; i++) {
      int ranint = ran.nextInt(f.length);
      RecommendedBlock r = new RecommendedBlock(sym: f[ranint]);

      z.add(r);
    }

    return z;
  }

  List toplist = [
    "Stocks",
    "Bonds",
    "Futures",
    "Options",
    "Trades",
    "Funds",
    "Commodities",
    "Currencies"
  ];

  List samplejson = [
    {
      "title": "Dividend Strategy",
      "des": "A diversified balanced portfolio with low risks",
      "growth": 6.48,
    },
    {
      "title": "Technology",
      "des": "A technology portfolio with medium risks",
      "growth": 12.4,
    },
    {
      "title": "Lead Strategy",
      "des": "A diversified balanced portfolio with low risks",
      "growth": 2.92,
    },
    {
      "title": "FMCG Strategy",
      "des": "A diversified balanced portfolio with medium risks",
      "growth": 9.54,
    },
  ];
  @override
  Widget build(BuildContext context) {
    Random ran1 = Random();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Market",
          style: titlestyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 55,
                    width: 300,
                    child: TextField(
                        decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: rad,
                          borderSide: BorderSide(color: Colors.transparent)),
                      filled: true,
                      fillColor: grey1,
                      focusColor: Colors.transparent,
                      prefixIcon: const Icon(Icons.search_rounded),
                      hintText: "Find stocks, bonds, funds...",
                      hintStyle: ustyle,
                      border: OutlineInputBorder(
                        borderRadius: rad,
                      ),
                    )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    color: grey1,
                    height: 55,
                    width: 65,
                    child: Icon(Icons.filter_list),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: toplist.map((e) {
                    return Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              color: grey1,
                            ),
                            //padding: EdgeInsets.all(4),
                            height: 25,
                            width: 90,
                            child: Center(
                              child: Text(
                                e,
                                style: ustyle.copyWith(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 8),
                child: Text(
                  "Collections".toUpperCase(),
                  style: headstyle,
                  textAlign: TextAlign.left,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: samplejson
                      .map((e) => CollectionBlock(
                          title: e['title'],
                          des: e['des'],
                          growth: e['growth']))
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Favorites".toUpperCase(),
                      style: headstyle,
                      textAlign: TextAlign.left,
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 8),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: generate_fav(ran1.nextInt(12) + 3),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 8),
                child: Text(
                  "Recommended".toUpperCase(),
                  style: headstyle,
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 10, left: 8),
                  child: Column(
                    children: generate_rec(ran1.nextInt(4) + 3),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
