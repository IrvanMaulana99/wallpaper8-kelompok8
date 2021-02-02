import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper8_kelompok8/Screens/wall8/wall8_home1.dart';
import 'package:wallpaper8_kelompok8/Screens/wall8/wall8_pilihan.dart';

class Wall8Kategori extends StatefulWidget {
  final String category;

  Wall8Kategori({Key key, @required this.category}) : super(key: key);

  @override
  _Wall8KategoriState createState() => _Wall8KategoriState();
}

class _Wall8KategoriState extends State<Wall8Kategori> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallpaper 8'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Wall8Home1()));
            },
          )
        ],
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('databasegambar')
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              var categoryDocuments = snapshot.data.docs.where(
                  (document) => (document.data()['tag'] == widget.category));

              return ListView.builder(
                itemCount: categoryDocuments.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: InkResponse(
                      onTap: () async {
                        await wall8atur(context: context,
                            url: categoryDocuments.elementAt(index).data()['url']);
                      },
                      child: CachedNetworkImage(
                        imageUrl:
                            categoryDocuments.elementAt(index).data()['url'],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
