import 'package:flutter/material.dart';
import 'package:projects1/tourism_app_ui/data/country_img_names.dart';
//import 'package:projects1/tourism_app_ui/data/placestovisit.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  @override
  Widget build(BuildContext context) {
    final idCIN = ModalRoute.of(context)?.settings.arguments;
    //final idPtV = ModalRoute.of(context)?.settings.arguments;
    final country = countries.firstWhere((e) => e["id"] == idCIN);
    //final places = visit.firstWhere((e1) => e1["id"] == idPtV);

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage(country["image"]), fit: BoxFit.cover)),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Text(country["Name"],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30)),
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Text(country["description"],
                    style: const TextStyle(fontSize: 15))),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: const Text("Places to visit",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(country["image1"]),
                                fit: BoxFit.cover)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,top: 160),
                        child: Text(country["Name1"],style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(country["image2"]),
                                fit: BoxFit.cover)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,top: 160),
                        child: Text(country["Name2"],style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(country["image3"]),
                                fit: BoxFit.cover)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,top: 160),
                        child: Text(country["Name3"],style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(country["image4"]),
                                fit: BoxFit.cover)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,top: 160),
                        child: Text(country["Name4"],style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
