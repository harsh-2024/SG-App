import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tsg_new/homePage.dart';
import 'package:youtube_plyr_iframe/youtube_plyr_iframe.dart';

class Players extends StatefulWidget {
  const Players({super.key});

  @override
  State<Players> createState() => _PlayersState();
}

class _PlayersState extends State<Players> {
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
                      "Our Players",
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
                Container(
                  child: ListView.builder(
                      padding: EdgeInsets.only(top: 10),

                      // itemExtent: 10,
                      shrinkWrap: true,
                      itemCount: videoControllers.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0xFFF5F5F5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              height: 208,
                              width: 304,
                              child: YoutubePlayerIFrame(
                                controller: videoControllers[index],
                                aspectRatio: 16 / 9,
                              ),
                            ),
                          ),
                        );
                      })),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
