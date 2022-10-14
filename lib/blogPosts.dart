import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tsg_new/models/BlogPostsModal.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Screens/fullBlogsScreen.dart';

String consumer_key = "ck_08466c61801f80805c8585de2f6ab47eb742765f";
String consumer_secret_key = "cs_8c5dac525648705466aa22c8fa34016f3ae89f9c";
String getBlogPostsURL =
    "https://shop.teamsg.in/wp-json/wp/v2/posts?consumer_key=${consumer_key}&consumer_secret=${consumer_secret_key}";

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

List<BlogPosts> postList = [];

class _PostsState extends State<Posts> {
  Future<List<BlogPosts>?> getPosts() async {
    final response = await http.get(Uri.parse(getBlogPostsURL));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        postList.add(BlogPosts.fromJson(i as Map<String, dynamic>));
      }
      return postList;
    } else
      return null;
  }

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
                      "Blogs",
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
                SizedBox(
                  height: 20,
                ),
                Image(image: AssetImage("assets/our_player1.png")),
                Container(
                  child: FutureBuilder(
                    future: getPosts(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          height: 500,
                          child: ListView.builder(
                            itemCount: postList.length,
                            itemExtent: 80,
                            itemBuilder: (context, index) {
                              print(postList.length);
                              return ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => FullBlogs(
                                          index: index,
                                          snapshot: snapshot,
                                          context: context,
                                        ),
                                      ));
                                },
                                isThreeLine: true,
                                subtitle: Text(
                                    overflow: TextOverflow.ellipsis,
                                    snapshot.data![index].excerpt!.rendered!),
                                leading: Image(
                                    image:
                                        AssetImage("assets/our_player1.png")),
                                title: Text(
                                    snapshot.data![index].title!.rendered!),
                              );
                            },
                          ),
                        );
                      } else {
                        return Text("Loading");
                      }
                    },
                  ),
                )
                // FutureBuilder<List<BlogPosts>>(
                //   future: ,
                //   builder: ((context, snapshot) {
                //     print(snapshot.data);
                //     if (snapshot.hasData) {
                //       return ListView.builder(
                //         itemExtent: 100,
                //         shrinkWrap: true,
                //         itemCount: snapshot.data?.length,
                //         itemBuilder: (context, index) {
                //           print(snapshot.data!.length);
                //           // print(
                //           //     snapshot.data![index].message![index].content?.rendered);
                //           print(snapshot.data![index]);
                //           // print(index);
                //           return ListTile(
                //             title: Text(
                //               snapshot
                //                   .data![0].message![index].content!.rendered
                //                   .toString(),
                //             ),
                //           );
                //         },
                //       );
                //     } else {
                //       print(snapshot.error);
                //       // throw Exception("error caught");
                //       return CircularProgressIndicator.adaptive();
                //     }
                //   }),
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
