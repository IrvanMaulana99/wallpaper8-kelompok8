import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Wall8Img extends StatefulWidget {
  // variabel
  final AsyncSnapshot<QuerySnapshot> snapshot;

  Wall8Img({Key key, this.snapshot}) : super(key: key);

  @override
  _Wall8ImgState createState() => _Wall8ImgState();
}

class _Wall8ImgState extends State<Wall8Img> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.snapshot.data.docs.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(1.0),
          child: GridTile(
            child: CachedNetworkImage(
              imageUrl: widget.snapshot.data.docs.elementAt(index)['url'],
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }
}
