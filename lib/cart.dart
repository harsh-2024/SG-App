import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tsg_new/profile.dart';
import 'package:tsg_new/scan.dart';
import 'package:tsg_new/sgTV.dart';

import 'homePage.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
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
                          MaterialPageRoute(builder: (context) => SGTV()));
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
        appBar: AppBar(
          leading: Image(image: AssetImage("assets/app_bar_trailing.png")),
          actions: [
            Image(
              image: AssetImage("assets/cart_trailing.png"),
            ),
          ],
          title: Column(
            children: [
              Center(
                  child: Image(
                image: AssetImage("assets/-Shop- Team Sg.png"),
              ))
            ],
          ),
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
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        prefixIcon: Icon(Icons.search_sharp),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        labelText: "Search For ${"Items"}"),
                  ),
                  SizedBox(
                    height: 20,
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
                  Row(children: [
                    Text(
                      "Explore by Price",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 10,
                    )
                  ]),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 70,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: <Widget>[
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(children: [
                    Text(
                      "Exclusive Collection",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 10,
                    )
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 135,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: <Widget>[
                        Image(image: AssetImage("assets/cricket_academy.png")),
                        SizedBox(
                          width: 10,
                        ),
                        Image(image: AssetImage("assets/cricket_academy.png")),
                        SizedBox(
                          width: 10,
                        ),
                        Image(image: AssetImage("assets/cricket_academy.png")),
                        SizedBox(
                          width: 10,
                        ),
                        Image(image: AssetImage("assets/cricket_academy.png")),
                        SizedBox(
                          width: 10,
                        ),
                        Image(image: AssetImage("assets/cricket_academy.png")),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    thickness: 5,
                    color: Color(0xffd9d9d9),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(children: [
                    Text(
                      "Footwear Collection",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 10,
                    )
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 212,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: <Widget>[
                        FootwearCollection(
                            "SG SCORER 4.0", "Cricket Shoes, Shoes", "₹12000"),
                        SizedBox(
                          width: 10,
                        ),
                        FootwearCollection(
                            "SG SCORER 4.0", "Cricket Shoes, Shoes", "₹12000"),
                        SizedBox(
                          width: 10,
                        ),
                        FootwearCollection(
                            "SG SCORER 4.0", "Cricket Shoes, Shoes", "₹12000"),
                        SizedBox(
                          width: 10,
                        ),
                        FootwearCollection(
                            "SG SCORER 4.0", "Cricket Shoes, Shoes", "₹12000"),
                        SizedBox(
                          width: 10,
                        ),
                        FootwearCollection(
                            "SG SCORER 4.0", "Cricket Shoes, Shoes", "₹12000"),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 5,
                    color: Color(0xffd9d9d9),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Text(
                      "Explore by Sports",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 10,
                    )
                  ]),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 350,
                    width: 320,
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      primary: false,
                      crossAxisSpacing: 15,
                      children: [
                        Container(
                          height: 190,
                          width: 151,
                          decoration: BoxDecoration(
                              color: Color(0xffa3a3a3),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        Container(
                          height: 190,
                          width: 151,
                          decoration: BoxDecoration(
                              color: Color(0xffa3a3a3),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        Container(
                          height: 190,
                          width: 151,
                          decoration: BoxDecoration(
                              color: Color(0xffa3a3a3),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        Container(
                          height: 190,
                          width: 151,
                          decoration: BoxDecoration(
                              color: Color(0xffa3a3a3),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "See More Updates",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
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
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 5,
                    color: Color(0xffd9d9d9),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Text(
                      "IPL Store",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 10,
                    )
                  ]),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 135,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: const <Widget>[
                        Image(image: AssetImage("assets/ipl_store.png")),
                        Image(image: AssetImage("assets/ipl_store.png")),
                        Image(image: AssetImage("assets/ipl_store.png")),
                        Image(image: AssetImage("assets/ipl_store.png")),
                        Image(image: AssetImage("assets/ipl_store.png")),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "See More Updates",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
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
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 5,
                    color: Color(0xffd9d9d9),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Image(
                      image: AssetImage("assets/shop_team_sg_2.png"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Our Contact Team :-",
                        style: GoogleFonts.roboto(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Text(
                        "Email : customersupport@teamsg.in",
                        style: GoogleFonts.roboto(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Text(
                        "Call : 18001800246",
                        style: GoogleFonts.roboto(
                            fontSize: 14, fontWeight: FontWeight.w500),
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

class FootwearCollection extends StatelessWidget {
  FootwearCollection(
    this.ItemName,
    this.ItemDesc,
    this.ItemPrice,
  );
  final String ItemName;
  final String ItemDesc;
  final String ItemPrice;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 169,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/footwear_clc.png"),
          SizedBox(
            height: 10,
          ),
          Text(
            ItemName,
            style: itemNameStyling(),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            ItemDesc,
            style: itemDescStyling(),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            ItemPrice,
            style: itemPriceStyling(),
          ),
        ],
      ),
    );
  }
}

TextStyle itemNameStyling() {
  return TextStyle(
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w600,
  );
}

TextStyle itemDescStyling() {
  return TextStyle(
    fontWeight: FontWeight.w200,
  );
}

TextStyle itemPriceStyling() {
  return TextStyle(
    fontWeight: FontWeight.w500,
  );
}
