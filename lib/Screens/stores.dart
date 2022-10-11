import "package:flutter/material.dart";

class StorePage extends StatelessWidget {
  StorePage({
    required this.imageURL,
  });
  String imageURL;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 300,
          flexibleSpace: FlexibleSpaceBar(
            background: Image(fit: BoxFit.fill, image: NetworkImage(imageURL)),
          ),
        )
      ],
    ));
  }
}
