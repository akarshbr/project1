import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MaterialApp(
      home: const SongifyHome(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.black,
          elevation: 0,
          centerTitle: true,
        ),
      ),
    ),
  );
}

class SongifyHome extends StatefulWidget {
  const SongifyHome({super.key});

  @override
  State<SongifyHome> createState() => _SongifyHomeState();
}

class _SongifyHomeState extends State<SongifyHome> {
  var genre = [
    "Music",
    "Podcast",
    "Live Event",
    "Made For You",
    "New Release",
    "Pop",
  ];
  var image = [
    "assets/music_image/music.jpg",
    "assets/music_image/podcast.jpg",
    "assets/music_image/liveevent.jpg",
    "assets/music_image/abstractpiano.jpg",
    "assets/music_image/airpods.jpg",
    "assets/music_image/jukebox.jpg",
  ];

  var albumImage = [
    "assets/music_album/BebeRexhaSacrifice.png",
    "assets/music_album/ExtremeWays.jpg",
    "assets/music_album/GetLucky.jpg",
    "assets/music_album/goodkidmaadcity.jpeg",
    "assets/music_album/HiiiPoWeR.jpg",
    "assets/music_album/KissLand.png",
    "assets/music_album/MartinGarrixPressure.jpg",
    "assets/music_album/MrMoraleandtheBigSteppers.png",
    "assets/music_album/TheWeekndStarboy.png",
    "assets/music_album/TravisScottUtopia.png",
    "assets/music_album/UltraviolenceLDR.png",
  ];
  var songName = [
    "Sacrifice",
    "Extreme Ways",
    "Get Lucky",
    "Money Trees",
    "Hiipower",
    "Tears in the rain",
    "Pressure",
    "N95",
    "Six Feet Under",
    "Circus Maximus",
    "Ultraviolence",
  ];

  var artist = [
    "Bebe Rexha",
    "Moby",
    "Daft Punk, Pharrell Williams, Nile Rodgers",
    "Kendrick Lamar",
    "Kendrick Lamar",
    "The Weeknd",
    "Tove Lo, Martin Garrix",
    "Kendrick Lamar",
    "The Weeknd",
    "Travis Scott",
    "Lana Del Rey",
  ];
  var bottomNavBarIcon = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.magnifyingGlass,
    FontAwesomeIcons.plus,
    FontAwesomeIcons.ellipsis,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Songify",
          style: GoogleFonts.bebasNeue(
              color: Colors.purpleAccent,
              fontSize: 30,
              letterSpacing: 3,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 20),
            child: Text(
              "Suggested PLaylist",
              style: GoogleFonts.bebasNeue(
                  fontSize: 25,
                  color: Colors.purpleAccent,
                  letterSpacing: 3,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(image.length, (index) {
                return InkWell(
                  onTap: () {},
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(image[index]),
                                fit: BoxFit.cover)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 181),
                        child: Text(
                          genre[index],
                          style: GoogleFonts.bebasNeue(
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 3,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 30),
            child: Text(
              "Recommended for You",
              style: GoogleFonts.bebasNeue(
                  fontSize: 25,
                  letterSpacing: 3,
                  color: Colors.purpleAccent,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            color: Colors.black,
            height: 450,
            child: ListView.builder(
                itemCount: albumImage.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: ListTile(
                      onTap: () {},
                      leading: Image.asset(albumImage[index]),
                      title: Text(songName[index],
                          style: GoogleFonts.bebasNeue(
                            color: Colors.purpleAccent,
                            fontSize: 20,
                            letterSpacing: 2,
                          )),
                      subtitle: Text(
                        artist[index],
                        maxLines: 1,
                        style: GoogleFonts.bebasNeue(
                          color: Colors.white,
                          fontSize: 12,
                          letterSpacing: 2,
                        ),
                      ),
                      trailing: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              highlightColor: Colors.purple,
                              onPressed: () {},
                              icon: const Icon(
                                Icons.star_border,
                                color: Colors.purpleAccent,
                              )),
                          IconButton(
                              highlightColor: Colors.purple,
                              onPressed: () {},
                              icon: const Icon(
                                Icons.download,
                                color: Colors.purpleAccent,
                              )),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          iconSize: 30,
          items: List.generate(4, (index) {
            return BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  bottomNavBarIcon[index],
                  color: Colors.purpleAccent,
                ),
                label: "");
          })),
    );
  }
}
