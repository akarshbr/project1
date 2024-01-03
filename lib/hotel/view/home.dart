import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/hotel_provider.dart';

void main() {
  runApp(ChangeNotifierProvider<HotelProvider>(
    create: (context) => HotelProvider(),
    child: MaterialApp(
      home: HotelHome(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}

class HotelHome extends StatefulWidget {
  const HotelHome({super.key});

  @override
  State<HotelHome> createState() => _HotelHomeState();
}

class _HotelHomeState extends State<HotelHome> {
  @override
  Widget build(BuildContext context) {
    var hotels = context.watch<HotelProvider>().hotel;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello user",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "Find Your Favourite Hotel",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Image(
                  image: AssetImage("assets/music_album/MrMoraleandtheBigSteppers.png"),
                  height: 60,
                  width: 60,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Material(
              elevation: 10,
              shadowColor: Colors.black,
              color: Colors.transparent,
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 40,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    focusColor: Colors.transparent,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.transparent, width: 0, style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(15)),
                    hintText: "Search For Hotel"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Text(
              "Popular Hotel",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            height: 230,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(hotelList.length, (index) {
                final currentHotel = hotels[index];
                return Card(
                  margin: EdgeInsets.only(right: 15),
                  child: SizedBox(
                    width: 170,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          height: 130,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage(currentHotel.image), fit: BoxFit.cover)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            currentHotel.name,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              currentHotel.place,
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "₹${currentHotel.price}/ Night",
                                style: TextStyle(color: Colors.purple, fontWeight: FontWeight.w500),
                              ),
                              Wrap(children: [
                                Text("${currentHotel.rating}",
                                    style: TextStyle(
                                        color: Colors.purple, fontWeight: FontWeight.w500)),
                                Icon(
                                  Icons.star,
                                  size: 18,
                                  color: Colors.purple,
                                ),
                              ])
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
            child: Text(
              "Hotel Packages",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: hotelList.length,
                itemBuilder: (context, index) {
                  var currentHotel = hotels[index];
                  return Container(
                    height: 150,
                    margin: EdgeInsets.only(bottom: 10),
                    child: Card(
                      child: Stack(
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(currentHotel.image), fit: BoxFit.cover)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 170, top: 18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentHotel.name,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                      currentHotel.place,
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    "₹${currentHotel.price}/ Night",
                                    style: TextStyle(color: Colors.purple),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.local_parking,
                                        color: Colors.purple,
                                      ),
                                      Icon(Icons.ac_unit, color: Colors.purple),
                                      Icon(Icons.wifi, color: Colors.purple),
                                      Icon(Icons.wine_bar, color: Colors.purple)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 320,top: 60),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text("Book",style: TextStyle(color: Colors.white),),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.purple),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(color: Colors.purple))),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.purple,),label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.purple,
            ),
            label: "Explore"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.purple,
            ),
            label: "Profile")
      ]),
    );
  }
}
