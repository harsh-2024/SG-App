import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsSeeMore extends StatefulWidget {
  const NewsSeeMore({super.key});

  @override
  State<NewsSeeMore> createState() => _NewsSeeMoreState();
}

class _NewsSeeMoreState extends State<NewsSeeMore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 22,
                ),
                Row(
                  children: const [
                    Text(
                      "News",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
