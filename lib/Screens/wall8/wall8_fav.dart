import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Wall8Fav extends StatefulWidget {
  // variabel
  final AsyncSnapshot<QuerySnapshot> snapshot;

  Wall8Fav({Key key, this.snapshot}) : super(key: key);

  @override
  _Wall8FavState createState() => _Wall8FavState();
}

class _Wall8FavState extends State<Wall8Fav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Wall 8 Favorit',
          style: TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }
}
