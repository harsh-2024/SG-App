import 'package:google_fonts/google_fonts.dart';
import 'package:tsg_new/BottomNav.dart';
import 'package:tsg_new/Screens/exclusiveTalk.dart';
import 'package:tsg_new/profile.dart';
import 'package:tsg_new/scan.dart';
import 'package:tsg_new/sgTV.dart';

import 'cart.dart';
import 'homePage.dart';
import 'postList.dart';
import 'singleBlogpage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_plyr_iframe/youtube_plyr_iframe.dart';
// import 'dart:html' as html;
import 'dart:convert';
import 'package:html/parser.dart';
import 'package:html/dom.dart' as dom;

import 'package:http/http.dart' as http;

// import 'pages/oldDemo.dart';
// import 'pages/thumbnailDemo.dart';

class AllBlogs extends StatefulWidget {
  const AllBlogs({Key? key}) : super(key: key);

  @override
  _AllBlogsState createState() => _AllBlogsState();
}

class _AllBlogsState extends State<AllBlogs> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;
  @override
  void initState() {
    super.initState();

    setState(() {
      isLoading = true;
      getBlogs();
    });
  }

  List<PostList> blogs = [];

  static String? convertUrlToId(String url, {bool trimWhitespaces = true}) {
    assert(url.isNotEmpty, 'Url cannot be empty');
    if (!url.contains("http") && (url.length == 11)) return url;
    if (trimWhitespaces) url = url.trim();

    for (var exp in [
      RegExp(
          r"^https:\/\/(?:www\.|m\.)?youtube\.com\/watch\?v=([_\-a-zA-Z0-9]{11}).*$"),
      RegExp(
          r"^https:\/\/(?:www\.|m\.)?youtube(?:-nocookie)?\.com\/embed\/([_\-a-zA-Z0-9]{11}).*$"),
      RegExp(r"^https:\/\/youtu\.be\/([_\-a-zA-Z0-9]{11}).*$")
    ]) {
      RegExpMatch? match = exp.firstMatch(url);
      if (match != null && match.groupCount >= 1) return match.group(1);
    }

    return null;
  }

  getYoutubeVideo(String url) {
    // var regExp =;

    // url = url.replaceFirst(
    //     RegExp(
    //         r"/^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#&?]*).*/"),
    //     "");
    print("hello---" + "${convertUrlToId(url)}");
    // print((url && url[7].length == 11) ? url[7] : false);

    return YoutubePlayerController(
      initialVideoId: convertUrlToId(url).toString(),
      // url
      //     .replaceAll("https://www.youtube.com/embed/", "")
      //     .replaceFirst(RegExp(r"\.[^]*"), ""),
      params: YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
      ),
    );
  }

  getBlogs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var cookie1 = prefs.getString("cookies");
    var url = Uri.parse('https://signin-signup-user.herokuapp.com/sgtvdata');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url, headers: {
      'Cookie': cookie1.toString(),
      'Content-Type': "application/json"
    });
    if (response.statusCode == 200) {
      // var jsonResponse =
      //     convert.jsonDecode(response.body) as Map<String, dynamic>;
      // var itemCount = jsonResponse['totalItems'];
      blogs = List<PostList>.from(json
          .decode(utf8.decode(response.bodyBytes))
          .map((x) => PostList.fromJson(x)));
      setState(() {
        isLoading = false;
      });
      print(blogs.length);
      // print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;

    return parsedString;
  }

  String? getYoutubdeLink(String body) {
    var document = parse(body);
    dom.Element? link = document.querySelector('iframe');
    String? imageLink = link != null ? link.attributes['src'] : '';
    print("ack-" + "$imageLink");
    return imageLink;
  }

  // String getText(String data) {
  //   var text = html.Element.span()..appendHtml(data);
  //   return text.innerText;
  // }

  @override
  Widget build(BuildContext context) {
    Future<bool> _shouldPop() async {
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => HomePage())));
      return true;
    }

    return WillPopScope(
      onWillPop: () async {
        return await _shouldPop();
      },
      child: Scaffold(
        bottomNavigationBar: BottomNavBar(),
        key: scaffoldKey,
        appBar: AppBar(
          titleSpacing: 0,
          actions: [
            Icon(Icons.account_circle),
            Container(
              height: double.infinity,
              width: 10,
            )
          ],
          title: Center(
            child: Text("TEAM SG",
                style: GoogleFonts.roboto(
                  color: Color(0xffed1c24),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
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
        backgroundColor: Color(0xFFF5F5F5),
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
                      "SG Brand Ambassadors",
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
                    height: 20,
                  ),
                  const Divider(
                    thickness: 8,
                    color: Color(0xffd9d9d9d9),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(children: const [
                    Text(
                      "Some Exclusive Talks",
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
                    height: 330,
                    child: isLoading
                        ? Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: blogs.length,
                            itemBuilder: (context, index) {
                              print(isLoading);
                              if (isLoading) {
                                return Container(
                                    height: 500,
                                    width: double.infinity,
                                    child: Center(
                                        child: CircularProgressIndicator()));
                              } else {
                                if (blogs.length == 0) {
                                  return Container(
                                      alignment: Alignment.bottomCenter,
                                      height: 500,
                                      child: Text("No Data"));
                                } else {
                                  return Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Color(0xFFF5F5F5),
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Container(
                                      height: 300,
                                      width: 300,
                                      child: Column(
                                        children: [
                                          YoutubePlayerIFrame(
                                            controller: getYoutubeVideo(
                                                (blogs[index].youtubeurl)),
                                            aspectRatio: 16 / 9,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SingleBlogPage(
                                                          title: blogs[index]
                                                              .heading,
                                                          content: blogs[index]
                                                              .description,
                                                          yURL: blogs[index]
                                                              .youtubeurl,
                                                        )),
                                              );
                                            },
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 5, 10, 25),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 5, 0, 0),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.95,
                                                      child: Text(
                                                        _parseHtmlString(
                                                            blogs[index]
                                                                .heading),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        softWrap: true,
                                                        style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 8, 0, 0),
                                                    child: Text(
                                                      _parseHtmlString(
                                                          blogs[index]
                                                              .description),
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      softWrap: true,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }
                              }
                            },
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
                              builder: ((context) => ExclusiveTalks())));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "See More Updates",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
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
              ),
            ),
          ],
        ),

        //  SafeArea(
        //   child: isLoading
        //       ? Center(child: CircularProgressIndicator())
        //       : ListView.builder(
        //           itemCount: blogs.length,
        //           itemBuilder: (context, index) {
        //             print(isLoading);
        //             if (isLoading) {
        //               return Container(
        //                   height: 500,
        //                   width: double.infinity,
        //                   child: Center(child: CircularProgressIndicator()));
        //             } else {
        //               if (blogs.length == 0) {
        //                 return Container(
        //                     alignment: Alignment.bottomCenter,
        //                     height: 500,
        //                     child: Text("No Data"));
        //               } else {
        //                 return Card(
        //                   clipBehavior: Clip.antiAliasWithSaveLayer,
        //                   color: Color(0xFFF5F5F5),
        //                   elevation: 3,
        //                   shape: RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.circular(20),
        //                   ),
        //                   child: Column(
        //                     mainAxisSize: MainAxisSize.min,
        //                     children: [
        //                       YoutubePlayerIFrame(
        //                         controller:
        //                             getYoutubeVideo((blogs[index].youtubeurl)),
        //                         aspectRatio: 16 / 9,
        //                       ),
        //                       GestureDetector(
        //                         onTap: () {
        //                           Navigator.push(
        //                             context,
        //                             MaterialPageRoute(
        //                                 builder: (context) => SingleBlogPage(
        //                                       title: blogs[index].heading,
        //                                       content: blogs[index].description,
        //                                       yURL: blogs[index].youtubeurl,
        //                                     )),
        //                           );
        //                         },
        //                         child: Padding(
        //                           padding: EdgeInsetsDirectional.fromSTEB(
        //                               10, 5, 10, 25),
        //                           child: Column(
        //                             mainAxisSize: MainAxisSize.max,
        //                             children: [
        //                               Padding(
        //                                 padding: EdgeInsetsDirectional.fromSTEB(
        //                                     0, 5, 0, 0),
        //                                 child: Container(
        //                                   width: MediaQuery.of(context)
        //                                           .size
        //                                           .width *
        //                                       0.95,
        //                                   child: Text(
        //                                     _parseHtmlString(
        //                                         blogs[index].heading),
        //                                     maxLines: 2,
        //                                     overflow: TextOverflow.ellipsis,
        //                                     softWrap: true,
        //                                     style: TextStyle(
        //                                       fontFamily: 'Poppins',
        //                                       fontSize: 18,
        //                                       fontWeight: FontWeight.w600,
        //                                     ),
        //                                   ),
        //                                 ),
        //                               ),
        //                               Padding(
        //                                 padding: EdgeInsetsDirectional.fromSTEB(
        //                                     0, 8, 0, 0),
        //                                 child: Text(
        //                                   _parseHtmlString(
        //                                       blogs[index].description),
        //                                   maxLines: 3,
        //                                   overflow: TextOverflow.ellipsis,
        //                                   softWrap: true,
        //                                   style: TextStyle(
        //                                     fontFamily: 'Poppins',
        //                                     fontSize: 15,
        //                                     fontWeight: FontWeight.w300,
        //                                   ),
        //                                 ),
        //                               )
        //                             ],
        //                           ),
        //                         ),
        //                       )
        //                     ],
        //                   ),
        //                 );
        //               }
        //             }
        //           },
        //         ),
        // ),
      ),
    );
  }
}
