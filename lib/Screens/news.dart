// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
// import 'package:tsg_new/models/NewsModal.dart';

// Future<News> getNews() async {
//   var request = http.Request(
//       'GET',
//       Uri.parse(
//           'https://cricbuzz-cricket.p.rapidapi.com/news/v1/detail/122025'));

//   request.headers.addAll({
//     'X-RapidAPI-Key': '205507bbb6msh87a7a722d4caa7dp10f1b6jsn5614c20f16dd',
//     'X-RapidAPI-Host': 'cricbuzz-cricket.p.rapidapi.com',
//   });

//   http.StreamedResponse response = await request.send();

//   if (response.statusCode == 200) {
//     print(await response.stream.bytesToString());
//     return News.fromJson(jsonDecode(request.body));
//   } else {
//     throw Exception("There is an error catching data");
//   }
// }

// class NewsPage extends StatefulWidget {
//   const NewsPage({super.key});

//   @override
//   State<NewsPage> createState() => _NewsPageState();
// }

// class _NewsPageState extends State<NewsPage> {
//   late Future<News> newsFetched;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     newsFetched = getNews();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           titleSpacing: 0,
//           actions: [
//             Icon(Icons.account_circle),
//             Container(
//               height: double.infinity,
//               width: 10,
//             )
//           ],
//           title: Center(
//             child: Text("TEAM SG",
//                 style: GoogleFonts.roboto(
//                   color: Color(0xffed1c24),
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 )),
//           ),
//           elevation: 0,
//           backgroundColor: Colors.white,
//           shadowColor: Colors.black,
//           flexibleSpace: Container(
//             decoration: BoxDecoration(
//                 color: Colors.black,
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(20),
//                     bottomRight: Radius.circular(20))),
//           ),
//         ),
//         body: ListView(
//           children: [
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//               child: Column(
//                 children: [
//                   Row(
//                     children: const [
//                       Text(
//                         "News",
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Icon(
//                         Icons.arrow_forward_ios_outlined,
//                         size: 18,
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   InkWell(
//                       onTap: getNews,
//                       child: Image(
//                           image: AssetImage("assets/new_banner_img.png"))),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   FutureBuilder(
//                       future: newsFetched,
//                       builder: (context, snapshot) {
//                         if (snapshot.hasData) {
//                           ;
//                         }
//                       })
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
