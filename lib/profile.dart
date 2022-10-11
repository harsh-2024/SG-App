import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tsg_new/blogs.dart';
import 'package:tsg_new/scan.dart';
import 'package:tsg_new/sgTV.dart';

import 'cart.dart';
import 'homePage.dart';
import 'login.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<bool> _shouldPop() async {
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => HomePage())));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await _shouldPop();
      },
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            currentIndex: selectedIndex,
            selectedItemColor: setIconColor,
            onTap: (index) => setState(() {
                  selectedIndex = index;
                  switch (selectedIndex) {
                    case 0:
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      }
                      break;
                    case 1:
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AllBlogs()));
                      break;
                    case 2:
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Scanner()));
                      break;
                    case 3:
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Cart()));
                      break;
                    case 4:
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Profile()));
                      break;

                    default:
                  }
                }),
            // onTap: null,
            items: const [
              BottomNavigationBarItem(
                  label: "Home",
                  icon: Image(image: AssetImage("assets/home_icon.png"))),
              BottomNavigationBarItem(
                  label: "SGTV",
                  icon: Image(image: AssetImage("assets/sg_tv_icon.png"))),
              BottomNavigationBarItem(
                  label: "Scan",
                  icon: Image(image: AssetImage("assets/scan_code_icon.png"))),
              BottomNavigationBarItem(
                  label: "Shop",
                  icon: Image(image: AssetImage("assets/cart_icon.png"))),
              BottomNavigationBarItem(
                label: "Menu",
                icon: Image(image: AssetImage("assets/profile_icon.png")),
              ),
            ]),
        drawerEnableOpenDragGesture: false,
        appBar: AppBar(
          title: Text("TEAM SG",
              style: GoogleFonts.roboto(
                color: Color(0xffed1c24),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          elevation: 0,
          backgroundColor: Colors.white,
          shadowColor: Colors.black,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
          ),
        ),
        body: ListView(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                ListTile(
                  leading: Image(image: AssetImage("assets/profile_lead.png")),
                  title: Text("Profile",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
                Divider(
                  color: Color(0xffa3a3a3),
                  thickness: 1,
                ),
                ListTile(
                  leading:
                      Image(image: AssetImage("assets/dealer_locator.png")),
                  title: Text("Dealer Locator",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
                Divider(
                  color: Color(0xffa3a3a3),
                  thickness: 1,
                ),
                ListTile(
                  leading:
                      Image(image: AssetImage("assets/our_players_icon.png")),
                  title: Text("Our Players",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
                Divider(
                  color: Color(0xffa3a3a3),
                  thickness: 1,
                ),
                ListTile(
                  leading: Image(image: AssetImage("assets/social_media.png")),
                  title: Text("Social Media",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
                Divider(
                  color: Color(0xffa3a3a3),
                  thickness: 1,
                ),
                ListTile(
                  leading: Image(image: AssetImage("assets/review.png")),
                  title: Text("Review",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
                Divider(
                  color: Color(0xffa3a3a3),
                  thickness: 1,
                ),
                ListTile(
                  leading: Image(image: AssetImage("assets/statement.png")),
                  title: Text("Statement",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
                Divider(
                  color: Color(0xffa3a3a3),
                  thickness: 1,
                ),
                ListTile(
                  leading: Image(image: AssetImage("assets/coupons.png")),
                  title: Text("Coupons",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
                Divider(
                  color: Color(0xffa3a3a3),
                  thickness: 1,
                ),
                ListTile(
                  onTap: () async {
                    SharedPreferences preferences =
                        await SharedPreferences.getInstance();
                    await preferences.clear();
                    Navigator.pushAndRemoveUntil<dynamic>(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) => LoginPage(),
                      ),
                      (route) =>
                          false, //if you want to disable back feature set to false
                    );
                  },
                  tileColor: Colors.red,
                  leading: Icon(Icons.logout_outlined),
                  title: Text("Logout",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                ),
                Divider(
                  color: Color(0xffa3a3a3),
                  thickness: 1,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
