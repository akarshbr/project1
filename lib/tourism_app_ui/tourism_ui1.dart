import 'package:flutter/material.dart';
import 'package:projects1/tourism_app_ui/data/country_img_names.dart';

import 'country_screen.dart';

void main() {
  runApp(MaterialApp(
    home: const TourismUI1(),
    theme: ThemeData(appBarTheme: const AppBarTheme(color: Colors.purple)),
    debugShowCheckedModeBanner: false,
    routes: {"Country": (context) => const CountryScreen()},
  ));
}

class TourismUI1 extends StatefulWidget {
  const TourismUI1({super.key});

  @override
  State<TourismUI1> createState() => _TourismUI1State();
}

class _TourismUI1State extends State<TourismUI1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey.shade100,
        appBar: AppBar(
          title: const Text(
            "Popular",
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.w600),
          ),
          automaticallyImplyLeading: false,
        ),
        body: ListView(
          children: countries.map((e) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, "Country", arguments: e["id"]);
              },
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 5, right: 5, top: 10),
                    height: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage(e["image"]), fit: BoxFit.cover)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 200),
                    child: Text(
                      e["Name"],
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ));
  }
}
