import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:wallpaper8_kelompok8/Screens/list/list%20tim/tim.dart';

class Yulianto extends StatefulWidget {
  @override
  _YuliantoState createState() => _YuliantoState();
}

class _YuliantoState extends State<Yulianto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tentang"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ListTim()));
            },
          )
        ],
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.black,
      body: Container(
        child: new ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 250.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Stack(
                            fit: StackFit.loose,
                            alignment: AlignmentDirectional.center,
                            children: <Widget>[
                              _buildProfileImage(),
                            ]),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Text('Yulianto Herlambang',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 5,
                  color: Colors.grey,
                ),
                Container(
                  color: Color.fromARGB(255, 21, 21, 21),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: Text('Email',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 6.0),
                            child: Text(
                              'yuliantoherlambang08@gmail.com',
                              style: TextStyle(color: Colors.white),
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: Text('No Telp',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 6.0),
                            child: Text(
                              '+62 8953 3142 8778',
                              style: TextStyle(color: Colors.white),
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: new Text(
                                      'Kelas',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  flex: 2,
                                ),
                                Expanded(
                                  child: Container(
                                    child: new Text(
                                      'Kelompok',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  flex: 2,
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 2.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: new Text(
                                      'TIF RP 18 CNS A',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  flex: 2,
                                ),
                                Expanded(
                                  child: Container(
                                    child: new Text(
                                      'Kelompok 8',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  flex: 2,
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
                BottomSection()
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildProfileImage() {
    return Container(
        width: 140.0,
        height: 140.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 4, color: Colors.grey),
          image: DecorationImage(
            image: NetworkImage(
                'https://firebasestorage.googleapis.com/v0/b/wallpaper8-login.appspot.com/o/yulianto.jpeg?alt=media&token=d9b86550-5a32-443c-8286-3b9b8b0483be'),
            fit: BoxFit.cover,
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class BottomSection extends StatefulWidget {
  @override
  _BottomSectionState createState() => new _BottomSectionState();
}

class _BottomSectionState extends State<BottomSection>
    with TickerProviderStateMixin {
  List<Tab> _tabs;
  List<Widget> _pages;
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _tabs = [
      new Tab(text: 'Keahlian'),
    ];
    _pages = [
      Keahlian(),
    ];
    _controller = new TabController(
      length: _tabs.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: new Column(
        children: <Widget>[
          new TabBar(
            controller: _controller,
            tabs: _tabs,
            labelColor: Theme.of(context).accentColor,
            indicatorColor: Theme.of(context).accentColor,
          ),
          new SizedBox.fromSize(
            size: const Size.fromHeight(300.0),
            child: new TabBarView(
              controller: _controller,
              children: _pages,
            ),
          ),
        ],
      ),
    );
  }
}

class Keahlian extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            LinearPercentIndicator(
              width: 350.0,
              animation: true,
              animationDuration: 1000,
              lineHeight: 16.0,
              leading: Container(
                  width: 60,
                  child: Text(
                    "Adobe Photoshop",
                    style: TextStyle(color: Colors.white),
                  )),
              percent: 0.70,
              linearStrokeCap: LinearStrokeCap.butt,
              progressColor: Colors.green,
            ),
            LinearPercentIndicator(
              width: 350.0,
              animation: true,
              animationDuration: 1000,
              lineHeight: 16.0,
              leading: Container(
                  width: 60,
                  child: Text(
                    "Java",
                    style: TextStyle(color: Colors.white),
                  )),
              percent: 0.45,
              linearStrokeCap: LinearStrokeCap.butt,
              progressColor: Colors.green,
            ),
            LinearPercentIndicator(
              width: 350.0,
              animation: true,
              animationDuration: 1000,
              lineHeight: 16.0,
              leading: Container(
                  width: 60,
                  child: Text(
                    "Corel Draw",
                    style: TextStyle(color: Colors.white),
                  )),
              percent: 0.60,
              linearStrokeCap: LinearStrokeCap.butt,
              progressColor: Colors.green,
            ),
            LinearPercentIndicator(
              width: 350.0,
              animation: true,
              animationDuration: 1000,
              lineHeight: 16.0,
              leading: Container(
                  width: 60,
                  child: Text(
                    "Adobe Illustrator",
                    style: TextStyle(color: Colors.white),
                  )),
              percent: 0.80,
              linearStrokeCap: LinearStrokeCap.butt,
              progressColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
