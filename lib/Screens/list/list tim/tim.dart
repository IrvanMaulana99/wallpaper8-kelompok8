// import
import 'package:flutter/material.dart';
import 'package:wallpaper8_kelompok8/Screens/dashboard/dashboard.dart';
import 'package:wallpaper8_kelompok8/Screens/tentang/tentang%20tim/irvanm.dart';
import 'package:wallpaper8_kelompok8/Screens/tentang/tentang%20tim/mluqman.dart';
import 'package:wallpaper8_kelompok8/Screens/tentang/tentang%20tim/yuliantoh.dart';

// listview
class ListTim extends StatefulWidget {
  @override
  _ListTimState createState() => _ListTimState();
}

class _ListTimState extends State<ListTim> {
  @override
  Widget build(BuildContext context) {
    // var judul appbar
    final judul = 'Tim - Kelompok 8';
    // scaffold
    return Scaffold(
      // appbar & judul
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(judul),
      ),
      backgroundColor: Color.fromARGB(255, 21, 21, 21),
      body: ListView(
        children: <Widget>[
          // irvan maulana
          ListTile(
            leading: Icon(
              Icons.account_box_outlined,
              color: Colors.white,
            ),
            title: Text(
              'Irvan Maulana',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Irvan()));
            },
          ),
          // yulianto herlambang
          ListTile(
            leading: Icon(
              Icons.account_box_outlined,
              color: Colors.white,
            ),
            title: Text(
              'Yulianto Herlambang',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Yulianto()));
            },
          ),
          // muhamad luqman
          ListTile(
            leading: Icon(
              Icons.account_box_outlined,
              color: Colors.white,
            ),
            title: Text(
              'Muhamad Luqman',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Luqman()));
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF6F35A5),
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Dashboard()));
        },
      ),
    );
  }
}
