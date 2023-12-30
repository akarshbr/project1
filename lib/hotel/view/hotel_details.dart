import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';

void main() {
  runApp(MaterialApp(
    home: DetailsHotel(),
    debugShowCheckedModeBanner: false,
  ));
}

class DetailsHotel extends StatefulWidget {
  const DetailsHotel({super.key});

  @override
  State<DetailsHotel> createState() => _DetailsHotelState();
}

class _DetailsHotelState extends State<DetailsHotel> {
  var hName = "Savoy";
  var hPLace = "Kannur,Kerala";
  var hRating = 4.1;
  var hPrice = 1200;

  @override
  Widget build(BuildContext context) {
    //var hotels = context.watch<HotelProvider>().hotel;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/hotel/savoy1.jpg"), fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 65, left: 10),
                  child: Text(hName,
                      style: TextStyle(
                          color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 35, left: 10),
                  child: Text(hPLace, style: TextStyle(color: Colors.white, fontSize: 30)),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 1),
                  margin: EdgeInsets.only(bottom: 10, left: 10),
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "$hRating/5 Reviews",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PannableRatingBar(
                        rate: hRating,
                        items: List.generate(5, (index) {
                          return RatingWidget(
                              selectedColor: Colors.purple,
                              unSelectedColor: Colors.grey,
                              child: Icon(
                                Icons.star,
                                size: 30,
                              ));
                        }),
                        onChanged: (value) {
                          setState(() {
                            hRating = value;
                          });
                        },
                      ),
                      Text(
                        "1Km to Payyambalam Beach",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "₹$hPrice",
                        style: TextStyle(
                            color: Colors.purple, fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "/per night",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      )
                    ],
                  )
                ],
              ),
            ),
            Center(
              child: MaterialButton(
                onPressed: () {},
                child: Text("Book Now"),
                textColor: Colors.white,
                color: Colors.purple,
                elevation: 10,
                minWidth: 300,
                height: 50,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: Text(
                hName,
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Text(
                "Savoy is a legendary bar restaurant in Kannur city, known for its "
                "peaceful and calm ambience. It is located near the beaches and "
                "many restaurants, making it an ideal spot to hangout with "
                "friends. The place has a vintage style Beer and Wine parlor with "
                "an open area where one can enjoy fresh air. The ambiance is really"
                " good and the staff is friendly. Savoy offers budget friendly meals"
                " with a variety of options including non-veg food. The prices are"
                " a bit too high and the chairs, tables and staff at the bar need "
                "improvement. Overall, Savoy is a great place to hangout with friend"
                "s and enjoy some drinks.",
                style: TextStyle(fontSize: 17.5),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(elevation: 0, items: [
        BottomNavigationBarItem(icon: Icon(Icons.search,size: 40,), label: "Search"),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart_solid,size: 40), label: "Favourite"),
        BottomNavigationBarItem(icon: Icon(Icons.settings,size: 40), label: "Settings")
      ]),
    );
  }
}
