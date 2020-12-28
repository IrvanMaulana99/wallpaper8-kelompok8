// background Halaman awal
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
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // gambar dekorasi atas
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/atas.png",
              width: size.width * 0.3,
            ),
          ),
          // gambar dekorasi bawah
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "assets/images/bawah_awal.png",
              width: size.width * 0.2,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
