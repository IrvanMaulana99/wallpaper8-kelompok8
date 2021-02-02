import 'package:flutter/material.dart';
import 'package:wallpaper8_kelompok8/Screens/dashboard/dashboard.dart';
import 'package:wallpaper8_kelompok8/Screens/list/list%20tim/tim.dart';

class TentangApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final judul = 'Tentang Aplikasi';
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(judul),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            _buildInfo1(context),
            _buildInfo2(),
            _buildInfo3(),
            _buildInfo4(context)
          ],
        ),
      ),
    );
  }

  Widget _buildInfo1(context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Card(
          child: Container(
              color: Color.fromARGB(255, 21, 21, 21),
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.redAccent,
                        child: Image.asset(
                          'assets/images/logo_tentang.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Wallpaper 8',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Versi",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "1.0.0",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.group,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Team",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => ListTim()));
                    },
                  ),
                ],
              )),
        ));
  }

  Widget _buildInfo2() {
    return Container(
        padding: EdgeInsets.all(10),
        child: Card(
          child: Container(
              color: Color.fromARGB(255, 21, 21, 21),
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Pembuat',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                  ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Ketua",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "Irvan Maulana",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Divider(),
                  ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Anggota",
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        "Yulianto Herlambang, Muhamad Luqman",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              )),
        ));
  }

  Widget _buildInfo3() {
    return Container(
        padding: EdgeInsets.all(10),
        child: Card(
          child: Container(
              color: Color.fromARGB(255, 21, 21, 21),
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Rincian Kelompok',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                  ListTile(
                    leading: Icon(
                      Icons.class_,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Kelas",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "TIF - RP 18 CNS A",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.group,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Kelompok 8",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )),
        ));
  }

  Widget _buildInfo4(context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Card(
          child: Container(
              color: Color.fromARGB(255, 21, 21, 21),
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Kembali",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "Kembali ke Dashboard",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Dashboard()));
                    },
                  ),
                ],
              )),
        ));
  }
}
