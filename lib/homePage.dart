import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:tsg_new/Screens/OurPlayersSeeMore.dart';
import 'package:tsg_new/Screens/newsSeeMore.dart';
import 'package:tsg_new/Screens/stores.dart';
import 'package:tsg_new/models/BlogPostsModal.dart';
import 'package:tsg_new/profile.dart';
import 'package:tsg_new/sgTV.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:youtube_plyr_iframe/youtube_plyr_iframe.dart';
import 'BottomNav.dart';
import 'Screens/news.dart';
import 'blogPosts.dart';
import 'cart.dart';
import 'main.dart';
import 'acadamy.dart';
import 'blogs.dart';
import 'login.dart';
import 'models/scoresModal.dart';
import 'scan.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert' as convert;
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'acadamy.dart';
import 'package:http/http.dart' as http;

List<YoutubePlayerController> videoControllers = [
  _videocontroller1,
  _videocontroller2,
  _videocontroller3,
  _videocontroller4,
  _videocontroller5,
  _videocontroller6,
];

final _videocontroller1 = YoutubePlayerController(
  initialVideoId: 'yAPn0wEKq4w',
  params: YoutubePlayerParams(
    autoPlay: false,
  ),
);
final _videocontroller2 = YoutubePlayerController(
  initialVideoId: '-3jkm1V9LTg',
  params: YoutubePlayerParams(
    autoPlay: false,
  ),
);
final _videocontroller3 = YoutubePlayerController(
  initialVideoId: 'McdVMt_fuI0',
  params: YoutubePlayerParams(
    autoPlay: false,
  ),
);
final _videocontroller4 = YoutubePlayerController(
  initialVideoId: '8IiIgC0eBXg',
  params: YoutubePlayerParams(
    autoPlay: false,
  ),
);
final _videocontroller5 = YoutubePlayerController(
  initialVideoId: '1fE19T935e4',
  params: YoutubePlayerParams(
    autoPlay: false,
  ),
);
final _videocontroller6 = YoutubePlayerController(
  initialVideoId: '1fE19T935e4',
  params: YoutubePlayerParams(
    autoPlay: false,
  ),
);
final List<Widget> Screens = [
  HomePage(),
  AllBlogs(),
  Scanner(),
  Cart(),
  Profile(),
];

int pageIndex = 0;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

Future<Scores> getScore() async {
  var request = http.Request(
      'GET',
      Uri.parse(
          'https://api.cricapi.com/v1/currentMatches?apikey=cdf354ee-2220-4146-92f2-89ba0c0a5ce0&offset=0'));

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
    return Scores.fromJson(jsonDecode(request.body));
  } else {
    // print(response.reasonPhrase);
    throw Exception("Error caught in fetching data");
  }
}

late Future<Scores> scoreFetch;

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> _scaffoldDrawerKey = GlobalKey<ScaffoldState>();
  List<String> _listviewData = [
    "Offers",
    "Spin Wheel",
    "Daily Visit",
    "Launch Offer",
  ];

  @override
  Widget build(BuildContext context) {
    setState(() {
      scoreFetch = getScore();
    });
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Are you sure?'),
              content: const Text('Do you want to exit an App'),
              actions: <Widget>[
                TextButton(
                  child: const Text('No'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                TextButton(
                  child: const Text('Yes'),
                  onPressed: () {
                    // ignore: avoid_print
                    print("object");
                    // Navigator.of(context).pop(true);
                    SystemNavigator.pop();
                  },
                )
              ],
            );
          },
        );
      },
      child: Scaffold(
        key: _scaffoldDrawerKey,
        drawer: Drawer(
          child: Container(
            padding: EdgeInsets.only(top: 50),
            height: double.infinity,
            width: 150,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  height: 70,
                  width: 70,
                  image: AssetImage(
                    "assets/sg_drawer_icon.png",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: const Image(
                    height: 32,
                    width: 32,
                    image: AssetImage("assets/offers_drawer.png"),
                  ),
                  title: Text(
                    "Offers",
                    style:
                        GoogleFonts.roboto(color: Colors.white, fontSize: 15),
                  ),
                ),
                ListTile(
                  leading: Image(
                    height: 32,
                    width: 32,
                    image: AssetImage(
                      "assets/spin_wheel_drawer_icon.png",
                    ),
                  ),
                  title: Text(
                    "Spin Wheel",
                    style:
                        GoogleFonts.roboto(color: Colors.white, fontSize: 15),
                  ),
                ),
                ListTile(
                  leading: Image(
                      image: AssetImage("assets/daily_visit_drawer_new.png")),
                  title: Text(
                    "Daily Visit",
                    style:
                        GoogleFonts.roboto(color: Colors.white, fontSize: 15),
                  ),
                ),
                ListTile(
                  hoverColor: Colors.red,
                  leading: Image(
                    height: 32,
                    width: 32,
                    image: AssetImage("assets/launch_offer_drawer.png"),
                  ),
                  title: Text(
                    "Launch Offer",
                    style:
                        GoogleFonts.roboto(color: Colors.white, fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavBar(),

        // BottomNavigationBar(
        //   showSelectedLabels: false,
        //   currentIndex: selectedIndex,
        //   selectedItemColor: setIconColor,
        //   onTap: (index) => setState(() {
        //     selectedIndex = index;
        //     switch (selectedIndex) {
        //       case 0:
        //         {
        //           Navigator.push(context,
        //               MaterialPageRoute(builder: (context) => HomePage()));
        //         }
        //         break;
        //       case 1:
        //         Navigator.push(context,
        //             MaterialPageRoute(builder: (context) => AllBlogs()));
        //         break;
        //       case 2:
        //         Navigator.push(context,
        //             MaterialPageRoute(builder: (context) => Scanner()));
        //         break;
        //       case 3:
        //         Navigator.push(
        //             context, MaterialPageRoute(builder: (context) => Cart()));
        //         break;
        //       case 4:
        //         Navigator.push(context,
        //             MaterialPageRoute(builder: (context) => Profile()));
        //         break;

        //       default:
        //     }
        //   }),
        //   // onTap: null,
        //   items: const [
        //     BottomNavigationBarItem(
        //         label: "Home",
        //         icon: Image(image: AssetImage("assets/home_icon.png"))),
        //     BottomNavigationBarItem(
        //         label: "SGTV",
        //         icon: Image(image: AssetImage("assets/sg_tv_icon.png"))),
        //     BottomNavigationBarItem(
        //         label: "Scan",
        //         icon: Image(image: AssetImage("assets/scan_code_icon.png"))),
        //     BottomNavigationBarItem(
        //         label: "Shop",
        //         icon: Image(image: AssetImage("assets/cart_icon.png"))),
        //     BottomNavigationBarItem(
        //       label: "Menu",
        //       icon: Image(image: AssetImage("assets/profile_icon.png")),
        //     ),
        //   ],
        // ),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Center(
                  child: Container(
                    width: double.infinity,
                    height: height * 0.37,
                    // padding: EdgeInsets.only(
                    //   left: width * 0.0318,
                    //   right: width * 0.0638,
                    // ),
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(22),
                            bottomRight: Radius.circular(22))),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: width * 0.0611,
                            ),
                            OutlinedButton(
                              style: ButtonStyle(
                                  minimumSize:
                                      MaterialStateProperty.all(Size(58, 26)),
                                  side: MaterialStatePropertyAll(
                                      BorderSide(color: Colors.white)),
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)))),
                              onPressed: () {
                                print("object");
                                _scaffoldDrawerKey.currentState?.openDrawer();
                              },
                              child: const Text(
                                "OFFERS",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Image(image: AssetImage("assets/Team Sg.png")),
                            SizedBox(
                              width: 60,
                            ),
                            const Icon(
                              Icons.search_sharp,
                              size: 30,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            const Icon(
                              Icons.account_circle,
                              size: 30,
                              color: Colors.white,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: width * 0.0611, right: width * 0.0611),
                          height: 21,
                          width: double.infinity,
                          // padding: EdgeInsets.only(left: 23, right: 23),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              InkWell(
                                onTap: null,
                                child: Expanded(
                                  child: Container(
                                    height: 21,
                                    width: 58,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color(0xff4e4e4e),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "All",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                onTap: null,
                                child: Expanded(
                                  child: Container(
                                    height: 21,
                                    width: 58,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      // color: selectedColor,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Live",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                onTap: null,
                                child: Expanded(
                                  child: Container(
                                    height: 21,
                                    width: 58,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      // color: selectedColor,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "League 1",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                onTap: null,
                                child: Expanded(
                                  child: Container(
                                    height: 21,
                                    width: 58,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      // color: selectedColor,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "League 2",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                onTap: null,
                                child: Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      // color: selectedColor,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "IND vs AUS",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LiveBannerTab(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => StorePage(
                                              imageURL:
                                                  "https://shop.teamsg.in/wp-content/uploads/2022/04/Gurugram-2-1536x1029.jpg",
                                            )));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.redAccent, width: 3)),
                                child: const CircleAvatar(
                                  radius: 35,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 31,
                                    backgroundImage: NetworkImage(
                                        "https://shop.teamsg.in/wp-content/uploads/2022/04/Gurugram-2-1536x1029.jpg"),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "SG Flagship\nStore",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StorePage(
                                    imageURL:
                                        "https://shop.teamsg.in/wp-content/uploads/2022/06/DDCA-1536x1029.jpg"),
                              ));
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: Expanded(
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.redAccent, width: 3)),
                                  child: const CircleAvatar(
                                    radius: 35,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 31,
                                      backgroundImage: NetworkImage(
                                          "https://shop.teamsg.in/wp-content/uploads/2022/06/DDCA-1536x1029.jpg"),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "DDCA Arjun\n Jaitley Stadium",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StorePage(
                                    imageURL:
                                        "https://shop.teamsg.in/wp-content/uploads/2022/04/Noida-1-1536x1029.jpg"),
                              ));
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.redAccent, width: 3)),
                                child: const CircleAvatar(
                                  radius: 35,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 31,
                                    backgroundImage: NetworkImage(
                                        "https://shop.teamsg.in/wp-content/uploads/2022/04/Noida-1-1536x1029.jpg"),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "SG Cricket\nStore",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => StorePage(
                                      imageURL:
                                          "https://shop.teamsg.in/wp-content/uploads/2022/06/mahagun-1536x1029.jpg"))));
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.redAccent, width: 3)),
                                child: const CircleAvatar(
                                  radius: 35,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 31,
                                    backgroundImage: NetworkImage(
                                        "https://shop.teamsg.in/wp-content/uploads/2022/06/mahagun-1536x1029.jpg"),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Mahagun\nMall Store",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => Players())));
                    },
                    child: Row(
                      children: const [
                        Text(
                          "Our Players",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  width: double.infinity,
                  height: 220,
                  child: ListView.builder(
                    itemCount: videoControllers.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      return Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 2,
                        color: Color(0xFFF5F5F5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          height: 450,
                          width: 350,
                          child: YoutubePlayerIFrame(
                            controller: videoControllers[index],
                            aspectRatio: 16 / 9,
                          ),
                        ),
                      );
                    }),

                    // Image(image: AssetImage("assets/our_player1.png")),
                    // Image(image: AssetImage("assets/our_player1.png")),
                    // Image(image: AssetImage("assets/our_player1.png")),
                    // Image(image: AssetImage("assets/our_player1.png")),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Container(
                //   padding: EdgeInsets.only(left: 20, right: 10),
                //   child: Row(
                //     children: <Widget>[
                //       Image.asset("assets/headingText_img.png"),
                //       const SizedBox(
                //         width: 20,
                //       ),
                //       Expanded(
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: const [
                //             Text(
                //               "Heading Text 1",
                //               style: TextStyle(fontWeight: FontWeight.w500),
                //             ),
                //             Text(
                //               "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum",
                //               style: TextStyle(fontWeight: FontWeight.w300),
                //             ),
                //             SizedBox(
                //               height: 10,
                //             ),
                //             Divider(
                //               endIndent: 10,
                //               color: Colors.grey,
                //             ),
                //           ],
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 20,
                ),
                // Container(
                //   padding: EdgeInsets.only(left: 20, right: 10),
                //   child: Row(
                //     children: <Widget>[
                //       Image.asset("assets/headingText_img.png"),
                //       const SizedBox(
                //         width: 20,
                //       ),
                //       Expanded(
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: const [
                //             Text(
                //               "Heading Text 2",
                //               style: TextStyle(fontWeight: FontWeight.w500),
                //             ),
                //             Text(
                //               "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum",
                //               style: TextStyle(fontWeight: FontWeight.w300),
                //             ),
                //             SizedBox(
                //               height: 10,
                //             ),
                //             Divider(
                //               endIndent: 10,
                //               color: Colors.grey,
                //             ),
                //           ],
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Players()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "See More Updates",
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.red,
                        size: 15,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.red,
                        size: 15,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Divider(
                  thickness: 8,
                  color: Color(0xffd9d9d9d9),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => Posts())));
                    },
                    child: Row(
                      children: const [
                        Text(
                          "Blogs",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: const <Widget>[
                      Image(image: AssetImage("assets/our_player1.png")),
                      Image(image: AssetImage("assets/our_player1.png")),
                      Image(image: AssetImage("assets/our_player1.png")),
                      Image(image: AssetImage("assets/our_player1.png")),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 10),
                  child: Row(
                    children: <Widget>[
                      Image.asset("assets/headingText_img.png"),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Heading Text 1",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum",
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              endIndent: 10,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 10),
                  child: Row(
                    children: <Widget>[
                      Image.asset("assets/headingText_img.png"),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Heading Text 2",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum",
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              endIndent: 10,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => Posts())));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "See More Updates",
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.red,
                        size: 15,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.red,
                        size: 15,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Divider(
                  thickness: 8,
                  color: Color(0xffd9d9d9d9),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => SearchAcadamy())));
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: const [
                        Text(
                          "Cricket Academy",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: const <Widget>[
                      Image(image: AssetImage("assets/our_player1.png")),
                      Image(image: AssetImage("assets/our_player1.png")),
                      Image(image: AssetImage("assets/our_player1.png")),
                      Image(image: AssetImage("assets/our_player1.png")),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => SearchAcadamy())));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "See More Updates",
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.red,
                        size: 15,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.red,
                        size: 15,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  thickness: 8,
                  color: Color(0xffd9d9d9d9),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => NewsSeeMore())));
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: const [
                        Text(
                          "News",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: const <Widget>[
                      Image(image: AssetImage("assets/our_player1.png")),
                      Image(image: AssetImage("assets/our_player1.png")),
                      Image(image: AssetImage("assets/our_player1.png")),
                      Image(image: AssetImage("assets/our_player1.png")),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 10),
                  child: Row(
                    children: <Widget>[
                      Image.asset("assets/news_img.png"),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Heading Text 1",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum",
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              endIndent: 10,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 10),
                  child: Row(
                    children: <Widget>[
                      Image.asset("assets/news_img.png"),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Heading Text 2",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum",
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              endIndent: 10,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 10),
                  child: Row(
                    children: <Widget>[
                      Image.asset("assets/news_img.png"),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Heading Text 3",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum",
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              endIndent: 10,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => NewsSeeMore())));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "See More Updates",
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.red,
                        size: 15,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.red,
                        size: 15,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  thickness: 8,
                  color: Color(0xffd9d9d9d9),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class LiveBannerTab extends StatelessWidget {
  const LiveBannerTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Container(
      height: 171,
      width: 364,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          color: Color(0xff2b2b2b),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(14),
            bottomRight: Radius.circular(14),
            topLeft: Radius.circular(14),
            topRight: Radius.circular(14),
          )),
      child: Column(
        children: <Widget>[
          Container(
            height: 136,
            width: 364,
            decoration: BoxDecoration(
                color: Color(0xff4e4e4e),
                borderRadius: BorderRadius.circular(14)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Image.asset("assets/live_banner_image.png"),
                        Text(
                          "Live",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Match 2 ODI ",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Divider(
                  thickness: 2,
                  color: Colors.white,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  height: 20,
                  width: 364,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Image.asset("assets/Flag_of_India.png"),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "IND",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 200,
                      ),
                      Text(
                        "(50)",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffdddddd)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "300/2",
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffffffff)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  height: 20,
                  width: 364,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Image.asset("assets/Flag_of_aus.png"),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "AUS",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 195,
                      ),
                      Text(
                        "(25)",
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xffdddddd),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "100/4",
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 20,
                  width: 364,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    "AUS needs 200 runs in 150 balls at 8 RPO.",
                    style: TextStyle(
                        color: Color(0xffe6e6e6), fontWeight: FontWeight.w300),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(right: 14),
            child: Align(
              alignment: Alignment.centerRight,
              child: const Text(
                "SCHEDULE",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xffc1c1c1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Color changeColorOnTap() {
  return Colors.grey;
}

Color setIconColor = Colors.white;
var selectedIndex = 0;
Color selectedColor = Colors.grey;

class Story extends StatefulWidget {
  const Story({super.key});

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         return await showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               title: const Text('Are you sure?'),
//               content: const Text('Do you want to exit an App'),
//               actions: <Widget>[
//                 TextButton(
//                   child: const Text('No'),
//                   onPressed: () {
//                     Navigator.of(context).pop(false);
//                   },
//                 ),
//                 TextButton(
//                   child: const Text('Yes'),
//                   onPressed: () {
//                     // ignore: avoid_print
//                     print("object");
//                     Navigator.of(context).pop(true);
//                   },
//                 )
//               ],
//             );
//           },
//         );
//       },
//       child: Scaffold(
//         key: scaffoldKey,
//         appBar: AppBar(
//           leading: const IconButton(
//               icon: Icon(
//                 Icons.menu,
//                 size: 22,
//                 color: Colors.transparent,
//               ),
//               onPressed: null),
//           backgroundColor: const Color(0xFF020000),
//           // automaticallyImplyLeading: true,
//           title: const Text(
//             'TeamSG',
//             style: TextStyle(
//               fontFamily: 'Poppins',
//               color: Color(0xFFFDFAFA),
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           actions: [],
//           centerTitle: true,
//           elevation: 4,
//         ),
//         backgroundColor: const Color(0xFFF5F5F5),
//         body: SafeArea(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
//               child: Column(
//                 // mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   // GestureDetector(
//                   //   onTap: () {
//                   //     Navigator.push(
//                   //       context,
//                   //       MaterialPageRoute(builder: (context) => Scanner()),
//                   //     );
//                   //   },
//                   //   child: Stack(
//                   //     alignment: Alignment.center,
//                   //     children: [
//                   //       ClipPath(
//                   //         clipper: MyCustomClipper(),
//                   //         child: Container(
//                   //           color: Color(0xff0097da),
//                   //           width: MediaQuery.of(context).size.width,
//                   //           height: MediaQuery.of(context).size.height * 0.09,
//                   //           alignment: Alignment(0.8, 0),
//                   //           child: Text(
//                   //             "Verify Product",
//                   //             style: TextStyle(
//                   //               fontFamily: 'Poppins',
//                   //               color: Color(0xFFFDFAFA),
//                   //               fontSize: 16,
//                   //             ),
//                   //           ),
//                   //         ),
//                   //       ),
//                   //       Positioned(
//                   //         bottom: 8,
//                   //         left: 0,
//                   //         child: ClipPath(
//                   //           clipper: MyCustomClipper2(),
//                   //           child: Container(
//                   //             color: Color(0xff00adef),
//                   //             width: MediaQuery.of(context).size.width * 0.6,
//                   //             height: MediaQuery.of(context).size.height * 0.045,
//                   //           ),
//                   //         ),
//                   //       ),
//                   //       Align(
//                   //         alignment: Alignment(-0.75, -1),
//                   //         child: Container(
//                   //           padding: EdgeInsets.all(3),
//                   //           decoration: BoxDecoration(
//                   //             color: Color(0xff0097da),
//                   //             borderRadius: BorderRadius.circular(10),
//                   //           ),
//                   //           width: MediaQuery.of(context).size.width * 0.20,
//                   //           height: MediaQuery.of(context).size.height * 0.11,
//                   //           child: ClipRRect(
//                   //             clipBehavior: Clip.antiAlias,
//                   //             borderRadius: BorderRadius.circular(10),
//                   //             child: Image.asset(
//                   //               "assets/image-000.jpg",
//                   //               fit: BoxFit.cover,
//                   //             ),
//                   //           ),
//                   //         ),
//                   //       ),
//                   //     ],
//                   //   ),
//                   // ),
//                   // SizedBox(
//                   //   height: 15,
//                   // ),
//                   // GestureDetector(
//                   //   onTap: () {
//                   //     Navigator.push(
//                   //       context,
//                   //       MaterialPageRoute(builder: (context) => AllBlogs()),
//                   //     );
//                   //   },
//                   //   child: Stack(
//                   //     alignment: Alignment.center,
//                   //     children: [
//                   //       ClipPath(
//                   //         clipper: MyCustomClipper(),
//                   //         child: Container(
//                   //           color: Color(0xff373737),
//                   //           width: MediaQuery.of(context).size.width,
//                   //           height: MediaQuery.of(context).size.height * 0.09,
//                   //           alignment: Alignment(0.8, 0),
//                   //           child: Text(
//                   //             "Blogs",
//                   //             style: TextStyle(
//                   //               fontFamily: 'Poppins',
//                   //               color: Color(0xFFFDFAFA),
//                   //               fontSize: 16,
//                   //             ),
//                   //           ),
//                   //         ),
//                   //       ),
//                   //       Positioned(
//                   //         bottom: 8,
//                   //         left: 0,
//                   //         child: ClipPath(
//                   //           clipper: MyCustomClipper2(),
//                   //           child: Container(
//                   //             color: Color(0xff606062),
//                   //             width: MediaQuery.of(context).size.width * 0.6,
//                   //             height: MediaQuery.of(context).size.height * 0.045,
//                   //           ),
//                   //         ),
//                   //       ),
//                   //       Align(
//                   //         alignment: Alignment(-0.75, -1),
//                   //         child: Container(
//                   //           padding: EdgeInsets.all(3),
//                   //           decoration: BoxDecoration(
//                   //             color: Color(0xff606062),
//                   //             borderRadius: BorderRadius.circular(10),
//                   //           ),
//                   //           width: MediaQuery.of(context).size.width * 0.20,
//                   //           height: MediaQuery.of(context).size.height * 0.11,
//                   //           child: ClipRRect(
//                   //             clipBehavior: Clip.antiAlias,
//                   //             borderRadius: BorderRadius.circular(10),
//                   //             child: Image.asset(
//                   //               "assets/image-001.png",
//                   //               fit: BoxFit.fill,
//                   //             ),
//                   //           ),
//                   //         ),
//                   //       ),
//                   //     ],
//                   //   ),
//                   // ),
//                   // SizedBox(
//                   //   height: 15,
//                   // ),
//                   // GestureDetector(
//                   //   onTap: () {
//                   //     Navigator.push(
//                   //       context,
//                   //       MaterialPageRoute(builder: (context) => SearchAcadamy()),
//                   //     );
//                   //   },
//                   //   child: Stack(
//                   //     // clipBehavior: Clip.antiAlias,
//                   //     alignment: Alignment.center,
//                   //     children: [
//                   //       ClipPath(
//                   //         clipper: MyCustomClipper(),
//                   //         child: Container(
//                   //           color: Color(0xffa7cd46),
//                   //           width: MediaQuery.of(context).size.width,
//                   //           height: MediaQuery.of(context).size.height * 0.09,
//                   //           alignment: Alignment(0.8, 0),
//                   //           child: Text(
//                   //             "Cricket Academy",
//                   //             style: TextStyle(
//                   //               fontFamily: 'Poppins',
//                   //               color: Color(0xFFFDFAFA),
//                   //               fontSize: 16,
//                   //             ),
//                   //           ),
//                   //         ),
//                   //       ),
//                   //       Positioned(
//                   //         bottom: 8,
//                   //         left: 0,
//                   //         child: ClipPath(
//                   //           clipper: MyCustomClipper2(),
//                   //           child: Container(
//                   //             color: Color(0xffd1e188),
//                   //             width: MediaQuery.of(context).size.width * 0.6,
//                   //             height: MediaQuery.of(context).size.height * 0.045,
//                   //           ),
//                   //         ),
//                   //       ),
//                   //       Align(
//                   //         alignment: Alignment(-0.75, -1),
//                   //         child: Container(
//                   //           padding: EdgeInsets.all(3),
//                   //           decoration: BoxDecoration(
//                   //             color: Color(0xffa7cd46),
//                   //             borderRadius: BorderRadius.circular(10),
//                   //           ),
//                   //           width: MediaQuery.of(context).size.width * 0.20,
//                   //           height: MediaQuery.of(context).size.height * 0.11,
//                   //           child: ClipRRect(
//                   //             clipBehavior: Clip.antiAlias,
//                   //             borderRadius: BorderRadius.circular(10),
//                   //             child: Image.asset(
//                   //               "assets/image-002.jpg",
//                   //               fit: BoxFit.cover,
//                   //             ),
//                   //           ),
//                   //         ),
//                   //       ),
//                   //     ],
//                   //   ),
//                   // ),
//                   // SizedBox(
//                   //   height: 15,
//                   // ),
//                   // GestureDetector(
//                   //   onTap: () {
//                   //     launchUrl(url: ("https://youtube.com/c/SGCricketOfficial"));
//                   //   },
//                   //   child: Stack(
//                   //     // clipBehavior: Clip.antiAlias,
//                   //     alignment: Alignment.center,
//                   //     children: [
//                   //       ClipPath(
//                   //         clipper: MyCustomClipper(),
//                   //         child: Container(
//                   //           color: Color(0xffec3539),
//                   //           width: MediaQuery.of(context).size.width,
//                   //           height: MediaQuery.of(context).size.height * 0.09,
//                   //           alignment: Alignment(0.8, 0),
//                   //           child: Text(
//                   //             "YouTube",
//                   //             style: TextStyle(
//                   //               fontFamily: 'Poppins',
//                   //               color: Color(0xFFFDFAFA),
//                   //               fontSize: 16,
//                   //             ),
//                   //           ),
//                   //         ),
//                   //       ),
//                   //       Positioned(
//                   //         bottom: 8,
//                   //         left: 0,
//                   //         child: ClipPath(
//                   //           clipper: MyCustomClipper2(),
//                   //           child: Container(
//                   //             color: Color(0xfff16f57),
//                   //             width: MediaQuery.of(context).size.width * 0.6,
//                   //             height: MediaQuery.of(context).size.height * 0.045,
//                   //           ),
//                   //         ),
//                   //       ),
//                   //       Align(
//                   //         alignment: Alignment(-0.75, -1),
//                   //         child: Container(
//                   //           padding: EdgeInsets.all(3),
//                   //           decoration: BoxDecoration(
//                   //             color: Color(0xffec3539),
//                   //             borderRadius: BorderRadius.circular(10),
//                   //           ),
//                   //           width: MediaQuery.of(context).size.width * 0.20,
//                   //           height: MediaQuery.of(context).size.height * 0.11,
//                   //           child: ClipRRect(
//                   //             clipBehavior: Clip.antiAlias,
//                   //             borderRadius: BorderRadius.circular(10),
//                   //             child: Image.asset(
//                   //               "assets/image-004.jpg",
//                   //               fit: BoxFit.cover,
//                   //             ),
//                   //           ),
//                   //         ),
//                   //       ),
//                   //     ],
//                   //   ),
//                   // ),
//                   // SizedBox(
//                   //   height: 15,
//                   // ),
//                   // GestureDetector(
//                   //   onTap: () {
//                   //     launchUrl(url: ("https://www.facebook.com/sgcricket"));
//                   //   },
//                   //   child: Stack(
//                   //     // clipBehavior: Clip.antiAlias,
//                   //     alignment: Alignment.center,
//                   //     children: [
//                   //       ClipPath(
//                   //         clipper: MyCustomClipper(),
//                   //         child: Container(
//                   //           color: Color(0xff465993),
//                   //           width: MediaQuery.of(context).size.width,
//                   //           height: MediaQuery.of(context).size.height * 0.09,
//                   //           alignment: Alignment(0.8, 0),
//                   //           child: Text(
//                   //             "Facebook",
//                   //             style: TextStyle(
//                   //               fontFamily: 'Poppins',
//                   //               color: Color(0xFFFDFAFA),
//                   //               fontSize: 16,
//                   //             ),
//                   //           ),
//                   //         ),
//                   //       ),
//                   //       Positioned(
//                   //         bottom: 8,
//                   //         left: 0,
//                   //         child: ClipPath(
//                   //           clipper: MyCustomClipper2(),
//                   //           child: Container(
//                   //             color: Color(0xff8285b2),
//                   //             width: MediaQuery.of(context).size.width * 0.6,
//                   //             height: MediaQuery.of(context).size.height * 0.045,
//                   //           ),
//                   //         ),
//                   //       ),
//                   //       Align(
//                   //         alignment: Alignment(-0.75, -1),
//                   //         child: Container(
//                   //           padding: EdgeInsets.all(3),
//                   //           decoration: BoxDecoration(
//                   //             color: Color(0xff465993),
//                   //             borderRadius: BorderRadius.circular(10),
//                   //           ),
//                   //           width: MediaQuery.of(context).size.width * 0.20,
//                   //           height: MediaQuery.of(context).size.height * 0.11,
//                   //           child: ClipRRect(
//                   //             clipBehavior: Clip.antiAlias,
//                   //             borderRadius: BorderRadius.circular(10),
//                   //             child: Image.asset(
//                   //               "assets/image-005.jpg",
//                   //               fit: BoxFit.cover,
//                   //             ),
//                   //           ),
//                   //         ),
//                   //       ),
//                   //     ],
//                   //   ),
//                   // ),
//                   // SizedBox(
//                   //   height: 15,
//                   // ),
//                   // GestureDetector(
//                   //   onTap: () {
//                   //     launchUrl(
//                   //         url:
//                   //             ("https://instagram.com/sgcricketofficial?utm_medium=copy_link"));
//                   //   },
//                   //   child: Stack(
//                   //     // clipBehavior: Clip.antiAlias,
//                   //     alignment: Alignment.center,
//                   //     children: [
//                   //       ClipPath(
//                   //         clipper: MyCustomClipper(),
//                   //         child: Container(
//                   //           color: Color(0xff9d3b92),
//                   //           width: MediaQuery.of(context).size.width,
//                   //           height: MediaQuery.of(context).size.height * 0.09,
//                   //           alignment: Alignment(0.8, 0),
//                   //           child: Text(
//                   //             "Instagram",
//                   //             style: TextStyle(
//                   //               fontFamily: 'Poppins',
//                   //               color: Color(0xFFFDFAFA),
//                   //               fontSize: 16,
//                   //             ),
//                   //           ),
//                   //         ),
//                   //       ),
//                   //       Positioned(
//                   //         bottom: 8,
//                   //         left: 0,
//                   //         child: ClipPath(
//                   //           clipper: MyCustomClipper2(),
//                   //           child: Container(
//                   //             color: Color(0xffea2a8d),
//                   //             width: MediaQuery.of(context).size.width * 0.6,
//                   //             height: MediaQuery.of(context).size.height * 0.045,
//                   //           ),
//                   //         ),
//                   //       ),
//                   //       Align(
//                   //         alignment: Alignment(-0.75, -1),
//                   //         child: Container(
//                   //           padding: EdgeInsets.all(3),
//                   //           decoration: BoxDecoration(
//                   //             color: Color(0xff973d8f),
//                   //             borderRadius: BorderRadius.circular(10),
//                   //           ),
//                   //           width: MediaQuery.of(context).size.width * 0.20,
//                   //           height: MediaQuery.of(context).size.height * 0.11,
//                   //           child: ClipRRect(
//                   //             clipBehavior: Clip.antiAlias,
//                   //             borderRadius: BorderRadius.circular(10),
//                   //             child: Image.asset(
//                   //               "assets/image-006.jpg",
//                   //               fit: BoxFit.cover,
//                   //             ),
//                   //           ),
//                   //         ),
//                   //       ),
//                   //     ],
//                   //   ),
//                   // ),
//                   // SizedBox(
//                   //   height: 15,
//                   // ),
//                   // GestureDetector(
//                   //   child: Stack(
//                   //     // clipBehavior: Clip.antiAlias,
//                   //     alignment: Alignment.center,
//                   //     children: [
//                   //       ClipPath(
//                   //         clipper: MyCustomClipper(),
//                   //         child: Container(
//                   //           color: Color(0xff00a54f),
//                   //           width: MediaQuery.of(context).size.width,
//                   //           height: MediaQuery.of(context).size.height * 0.09,
//                   //           alignment: Alignment(0.8, 0),
//                   //           child: Text(
//                   //             "Live Score",
//                   //             style: TextStyle(
//                   //               fontFamily: 'Poppins',
//                   //               color: Color(0xFFFDFAFA),
//                   //               fontSize: 16,
//                   //             ),
//                   //           ),
//                   //         ),
//                   //       ),
//                   //       Positioned(
//                   //         bottom: 8,
//                   //         left: 0,
//                   //         child: ClipPath(
//                   //           clipper: MyCustomClipper2(),
//                   //           child: Container(
//                   //             color: Color(0xff4fbc82),
//                   //             width: MediaQuery.of(context).size.width * 0.6,
//                   //             height: MediaQuery.of(context).size.height * 0.045,
//                   //           ),
//                   //         ),
//                   //       ),
//                   //       Align(
//                   //         alignment: Alignment(-0.75, -1),
//                   //         child: Container(
//                   //           padding: EdgeInsets.all(3),
//                   //           decoration: BoxDecoration(
//                   //             color: Color(0xff00a54f),
//                   //             borderRadius: BorderRadius.circular(10),
//                   //           ),
//                   //           width: MediaQuery.of(context).size.width * 0.20,
//                   //           height: MediaQuery.of(context).size.height * 0.11,
//                   //           child: ClipRRect(
//                   //             clipBehavior: Clip.antiAlias,
//                   //             borderRadius: BorderRadius.circular(10),
//                   //             child: Image.asset(
//                   //               "assets/image-017.jpg",
//                   //               fit: BoxFit.cover,
//                   //             ),
//                   //           ),
//                   //         ),
//                   //       ),
//                   //     ],
//                   //   ),
//                   // ),

//                   const SizedBox(
//                     height: 15,
//                   ),
//                   // GestureDetector(
//                   //   child: Stack(
//                   //     //     // clipBehavior: Clip.antiAlias,
//                   //     alignment: Alignment.center,
//                   //     children: [
//                   //       ClipPath(
//                   //         clipper: MyCustomClipper(),
//                   //         child: Container(
//                   //           color: Color(0xfff58220),
//                   //           width: MediaQuery.of(context).size.width,
//                   //           height: MediaQuery.of(context).size.height * 0.09,
//                   //           alignment: Alignment(0.8, 0),
//                   //           child: Text(
//                   //             "News",
//                   //             style: TextStyle(
//                   //               fontFamily: 'Poppins',
//                   //               color: Color(0xFFFDFAFA),
//                   //               fontSize: 16,
//                   //             ),
//                   //           ),
//                   //         ),
//                   //       ),
//                   //       Positioned(
//                   //         bottom: 8,
//                   //         left: 0,
//                   //         child: ClipPath(
//                   //           clipper: MyCustomClipper2(),
//                   //           child: Container(
//                   //             color: Color(0xfff9a64a),
//                   //             width: MediaQuery.of(context).size.width * 0.6,
//                   //             height: MediaQuery.of(context).size.height * 0.045,
//                   //           ),
//                   //         ),
//                   //       ),
//                   //       Align(
//                   //         alignment: Alignment(-0.75, -1),
//                   //         child: Container(
//                   //           padding: EdgeInsets.all(3),
//                   //           decoration: BoxDecoration(
//                   //             color: Color(0xfff58220),
//                   //             borderRadius: BorderRadius.circular(10),
//                   //           ),
//                   //           width: MediaQuery.of(context).size.width * 0.20,
//                   //           height: MediaQuery.of(context).size.height * 0.11,
//                   //           child: ClipRRect(
//                   //             clipBehavior: Clip.antiAlias,
//                   //             borderRadius: BorderRadius.circular(10),
//                   //             child: Image.asset(
//                   //               "assets/image-019.jpg",
//                   //               fit: BoxFit.cover,
//                   //             ),
//                   //           ),
//                   //         ),
//                   //       ),
//                   //     ],
//                   //   ),
//                   // ),

//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => Scanner()),
//                       );
//                     },
//                     child: Align(
//                       alignment: const AlignmentDirectional(0, 0),
//                       child: Container(
//                         width: double.infinity,
//                         height: MediaQuery.of(context).size.height * 0.08,
//                         decoration: BoxDecoration(
//                           color: Colors.redAccent[700],
//                           borderRadius: BorderRadius.circular(25),
//                         ),
//                         alignment: const AlignmentDirectional(0, 0),
//                         child: const Text(
//                           'Verify Product',
//                           textAlign: TextAlign.start,
//                           style: TextStyle(
//                             fontFamily: 'Poppins',
//                             color: Color(0xFFFDFAFA),
//                             fontSize: 18,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const AllBlogs()),
//                       );
//                     },
//                     child: Container(
//                       width: double.infinity,
//                       height: MediaQuery.of(context).size.height * 0.08,
//                       decoration: BoxDecoration(
//                         color: Colors.redAccent[700],
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                       alignment: const AlignmentDirectional(0, 0),
//                       child: const Text(
//                         'SG Brand Ambassadors',
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           color: Color(0xFFFDFAFA),
//                           fontSize: 18,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const SearchAcadamy()),
//                       );
//                     },
//                     child: Container(
//                       width: double.infinity,
//                       height: MediaQuery.of(context).size.height * 0.08,
//                       decoration: BoxDecoration(
//                         color: Colors.redAccent[700],
//                         shape: BoxShape.rectangle,
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                       alignment: const AlignmentDirectional(0, 0),
//                       child: const Text(
//                         'Cricket Academy',
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           color: Color(0xFFFDFAFA),
//                           fontSize: 18,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),

//                   GestureDetector(
//                     onTap: () async {
//                       SharedPreferences preferences =
//                           await SharedPreferences.getInstance();
//                       await preferences.clear();
//                       Navigator.pushAndRemoveUntil<dynamic>(
//                         context,
//                         MaterialPageRoute<dynamic>(
//                           builder: (BuildContext context) => const LoginPage(),
//                         ),
//                         (route) =>
//                             false, //if you want to disable back feature set to false
//                       );
//                     },
//                     child: Container(
//                       width: double.infinity,
//                       height: MediaQuery.of(context).size.height * 0.08,
//                       decoration: BoxDecoration(
//                         color: Colors.redAccent[700],
//                         shape: BoxShape.rectangle,
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                       alignment: const AlignmentDirectional(0, 0),
//                       child: const Text(
//                         'Logout',
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           color: Color(0xFFFDFAFA),
//                           fontSize: 18,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                   ),
//                   // GestureDetector(
//                   //   onTap: () {
//                   //     launchUrl(url: ("https://youtube.com/c/SGCricketOfficial"));
//                   //     //     // Navigator.push(
//                   //     //     //   context,
//                   //     //     //   MaterialPageRoute(
//                   //     //     //       builder: (context) => WebViewBlogs(
//                   //     //     //           url: "https://youtube.com/c/SGCricketOfficial")),
//                   //     //     // );
//                   //   },
//                   //   child: Container(
//                   //     width: double.infinity,
//                   //     height: MediaQuery.of(context).size.height * 0.08,
//                   //     decoration: BoxDecoration(
//                   //       color: Colors.redAccent[700],
//                   //       shape: BoxShape.rectangle,
//                   //       borderRadius: BorderRadius.circular(25),
//                   //     ),
//                   //     alignment: AlignmentDirectional(0, 0),
//                   //     child: Text(
//                   //       'Live Score',
//                   //       style: TextStyle(
//                   //         fontFamily: 'Poppins',
//                   //         color: Color(0xFFFDFAFA),
//                   //         fontSize: 18,
//                   //         fontWeight: FontWeight.w500,
//                   //       ),
//                   //     ),
//                   //   ),
//                   // ),
//                   // SizedBox(
//                   //   height: 15,
//                   // ),
//                   // GestureDetector(
//                   //   onTap: () {
//                   //     launchUrl(url: ("https://www.facebook.com/sgcricket"));
//                   //   },
//                   //   child: Container(
//                   //     width: double.infinity,
//                   //     height: MediaQuery.of(context).size.height * 0.08,
//                   //     decoration: BoxDecoration(
//                   //       color: Colors.redAccent[700],
//                   //       shape: BoxShape.rectangle,
//                   //       borderRadius: BorderRadius.circular(25),
//                   //     ),
//                   //     alignment: AlignmentDirectional(0, 0),
//                   //     child: Text(
//                   //       'News',
//                   //       style: TextStyle(
//                   //         fontFamily: 'Poppins',
//                   //         color: Color(0xFFFDFAFA),
//                   //         fontSize: 18,
//                   //         fontWeight: FontWeight.w500,
//                   //       ),
//                   //     ),
//                   //   ),
//                   // ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   // GestureDetector(
//                   //   onTap: () {
//                   //     launchUrl(
//                   //         url:
//                   //             ("https://instagram.com/sgcricketofficial?utm_medium=copy_link"));
//                   //     // // Navigator.push(
//                   //     //     //   context,
//                   //     //     //   MaterialPageRoute(
//                   //     //     //       builder: (context) => WebViewBlogs(
//                   //     //     //           url:
//                   //     //     //               "https://instagram.com/sgcricketofficial?utm_medium=copy_link")),
//                   //     //     // );
//                   //   },
//                   //   child: Container(
//                   //     width: double.infinity,
//                   //     height: MediaQuery.of(context).size.height * 0.08,
//                   //     decoration: BoxDecoration(
//                   //       color: Colors.redAccent[700],
//                   //       shape: BoxShape.rectangle,
//                   //       borderRadius: BorderRadius.circular(25),
//                   //     ),
//                   //     alignment: AlignmentDirectional(0, 0),
//                   //     child: Text(
//                   //       'Instagram',
//                   //       style: TextStyle(
//                   //         fontFamily: 'Poppins',
//                   //         color: Color(0xFFFDFAFA),
//                   //         fontSize: 18,
//                   //         fontWeight: FontWeight.w500,
//                   //       ),
//                   //     ),
//                   //   ),
//                   // ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       IconButton(
//                           icon: const Icon(
//                             (FontAwesomeIcons.youtube),
//                             size: 34,
//                             color: Colors.red,
//                           ),
//                           onPressed: () {
//                             launchUrl(
//                                 url:
//                                     ("https://youtube.com/c/SGCricketOfficial"));
//                           }),
//                       IconButton(
//                           icon: const Icon(
//                             (FontAwesomeIcons.facebook),
//                             size: 34,
//                             color: Color(0xFF4267B2),
//                           ),
//                           onPressed: () {
//                             launchUrl(
//                                 url: ("https://www.facebook.com/sgcricket"));
//                           }),
//                       // IconButton(
//                       //     icon: Icon(
//                       //       (FontAwesomeIcons.twitter),
//                       //       size: 34,
//                       //       color: Color(0xFF4267B2),
//                       //     ),
//                       //     onPressed: () {
//                       //       launchUrl(
//                       //           url: ("https://www.facebook.com/sgcricket"));
//                       //     }),
//                       IconButton(
//                           icon: const Icon(
//                             (FontAwesomeIcons.instagram),
//                             size: 34,
//                             color: Color(0xFF8a3ab9),
//                           ),
//                           onPressed: () {
//                             launchUrl(
//                                 url:
//                                     ("https://instagram.com/sgcricketofficial?utm_medium=copy_link"));
//                           }),
//                     ],
//                   ),
//                   // Container(
//                   //   width: double.infinity,
//                   //   height: MediaQuery.of(context).size.height * 0.25,
//                   //   decoration: BoxDecoration(
//                   //     color: Colors.transparent,
//                   //   ),
//                   // ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void launchUrl({
//     required String url,
//   }) async {
//     try {
//       print(await canLaunch(url));

//       // if (await canLaunch(url)) {
//       var err = await launch(
//         url,
//         forceSafariVC: false,
//         universalLinksOnly: true,
//       );
//       //   print(err);
//       // } else {
//       //   // scaffoldKey.currentState
//       //   //     .showSnackBar(new SnackBar(content: new Text("")));
//       //   throw 'Could not launch ${url}';
//       // }
//     } catch (e) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(new SnackBar(content: new Text(e.toString())));
//     }
//   }
// }
