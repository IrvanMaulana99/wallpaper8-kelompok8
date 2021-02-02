import 'package:flutter/material.dart';
import 'package:wallpaper8_kelompok8/Screens/wall8/wall8_fav.dart';
import 'package:wallpaper8_kelompok8/Screens/wall8/wall8_home.dart';
import 'package:wallpaper8_kelompok8/Screens/wall8/wall8_images.dart';

class Wall8Home1 extends StatefulWidget {
  @override
  _Wall8Home1State createState() => _Wall8Home1State();
}

class _Wall8Home1State extends State<Wall8Home1> {
  final pages = [Wall8Img(), Wall8Home(), Wall8Fav()];
  final pageController = PageController(initialPage: 1);
  int currentSelected = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wallpaper 8"),
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: pages.length,
        itemBuilder: (buildContext, int index) {
          return pages[index];
        },
        onPageChanged: (int index) {
          setState(() {
            currentSelected = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentSelected,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.image), label: 'Semua Gambar'),
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
      ),
    );
  }
}
