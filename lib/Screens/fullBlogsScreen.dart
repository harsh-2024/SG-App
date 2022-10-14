import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/BlogPostsModal.dart';

class FullBlogs extends StatelessWidget {
  int index;
  BuildContext context;
  AsyncSnapshot<List<BlogPosts>?> snapshot;

  FullBlogs(
      {required this.context, required this.index, required this.snapshot});

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
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Container(
                    child: Text(
                  snapshot.data![index].title!.rendered!,
                  style: TextStyle(fontSize: 22),
                )),
                SizedBox(
                  height: 10,
                ),
                Text(snapshot.data![index].content!.rendered!)
              ],
            ),
          )
        ],
      ),
    );
  }
}
