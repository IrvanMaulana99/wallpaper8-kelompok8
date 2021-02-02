import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper8_kelompok8/Screens/dashboard/dashboard.dart';
import 'package:wallpaper8_kelompok8/Screens/wall8/wall8_fav.dart';
import 'package:wallpaper8_kelompok8/Screens/wall8/wall8_home.dart';
import 'package:wallpaper8_kelompok8/Screens/wall8/wall8_images.dart';

class Wall8Home1 extends StatefulWidget {
  @override
  _Wall8Home1State createState() => _Wall8Home1State();
}

class _Wall8Home1State extends State<Wall8Home1> {
  final pageController = PageController(initialPage: 1);
  int currentSelected = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wallpaper 8"),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Dashboard()));
            },
          )
        ],
      ),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('databasegambar').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData && snapshot.data.docs.isNotEmpty) {
            return PageView.builder(
              controller: pageController,
              itemCount: 3,
              itemBuilder: (buildContext, int index) {
                return _getPageAtIndex(index, snapshot);
              },
              onPageChanged: (int index) {
                setState(() {
                  currentSelected = index;
                });
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: currentSelected,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.image), label: 'Semua Gambar'),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorit'),
      ],
      onTap: (int index) {
        setState(() {
          currentSelected = index;
          pageController.animateToPage(currentSelected,
              curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 400));
        });
      },
    );
  }

  Widget _getPageAtIndex(int index, AsyncSnapshot<QuerySnapshot> snapshot) {
    switch (index) {
      case 0:
        return Wall8Img(
          snapshot: snapshot,
        );
        break;
      case 1:
        return Wall8Home(
          snapshot: snapshot,
        );
        break;
      case 2:
        return Wall8Fav(
          snapshot: snapshot,
        );
        break;
      default:
        return CircularProgressIndicator();
        break;
    }
  }
}
