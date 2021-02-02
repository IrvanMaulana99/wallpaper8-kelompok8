import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper8_kelompok8/Screens/wall8/wall8_kategori_gambar.dart';

class Wall8Home extends StatefulWidget {
  // variabel
  final AsyncSnapshot<QuerySnapshot> snapshot;
  // inisialisasi variabel
  Wall8Home({Key key, this.snapshot}) : super(key: key);

  @override
  _Wall8HomeState createState() => _Wall8HomeState();
}

class _Wall8HomeState extends State<Wall8Home> {
  final categories = List<String>();
  final categoryImages = List<String>();

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();

    widget.snapshot.data.docs.forEach((document) {
      var category = document.data()['tag'];

      if (!categories.contains(category)) {
        categories.add(category);
        categoryImages.add(document.data()['url']);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return InkResponse(
            onTap: () {
              // menampilkan gambar pada kategori
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Wall8Kategori(category: categories.elementAt(index));
              }));
            },
            child: Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(500.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                    categoryImages.elementAt(index),
                  ),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                categories.elementAt(index).toUpperCase(),
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    decoration: TextDecoration.combine(
                      [TextDecoration.underline, TextDecoration.overline],
                    ),
                    decorationStyle: TextDecorationStyle.double),
              ),
            ),
          );
        });
  }
}
