import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Wall8Home extends StatefulWidget {
  // variabel
  final AsyncSnapshot<QuerySnapshot> snapshot;
  // inisialisasi variabel
  Wall8Home({Key key, this.snapshot}) : super(key: key);

  @override
  _Wall8HomeState createState() => _Wall8HomeState();
}

class _Wall8HomeState extends State<Wall8Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Wall 8 Home',
          style: TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }
}
