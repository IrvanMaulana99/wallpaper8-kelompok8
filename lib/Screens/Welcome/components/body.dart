// import yang diperlukan
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpaper8_kelompok8/Screens/Login/login_screen.dart';
import 'package:wallpaper8_kelompok8/Screens/Signup/signup_screen.dart';
import 'package:wallpaper8_kelompok8/Screens/Welcome/components/background.dart';
import 'package:wallpaper8_kelompok8/components/rounded_button.dart';
import 'package:wallpaper8_kelompok8/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // judul
            Text(
              "Selamat Datang di Wallpaper 8",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            // batas
            SizedBox(height: size.height * 0.05),
            // gambar halaman awal
            SvgPicture.asset(
              "assets/icons/awal.svg",
              height: size.height * 0.45,
            ),
            // batas
            SizedBox(height: size.height * 0.05),
            // button menuju Login
            RoundedButton(
              text: "Login",
              // tampilkan halaman Login
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            // button menuju Daftar
            RoundedButton(
              text: "Daftar",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              // tampilkan halaman daftar
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
