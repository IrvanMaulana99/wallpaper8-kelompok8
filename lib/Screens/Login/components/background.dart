// gambar background login
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // gambar background atas
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/atas.png",
              width: size.width * 0.35,
            ),
          ),
          // gambar background bawah
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "assets/images/login_bawah.png",
              width: size.width * 0.4,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
