// import
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpaper8_kelompok8/Screens/Login/login_screen.dart';
import 'package:wallpaper8_kelompok8/Screens/Signup/components/background.dart';
import 'package:wallpaper8_kelompok8/Screens/Signup/components/or_divider.dart';
import 'package:wallpaper8_kelompok8/Screens/Signup/components/social_icon.dart';
import 'package:wallpaper8_kelompok8/Screens/Welcome/welcome_screen.dart';
import 'package:wallpaper8_kelompok8/components/cek_akun.dart';
import 'package:wallpaper8_kelompok8/components/rounded_button.dart';
import 'package:wallpaper8_kelompok8/components/rounded_input_field.dart';
import 'package:wallpaper8_kelompok8/components/rounded_password_field.dart';

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
              "Daftar",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            // batas
            SizedBox(height: size.height * 0.03),
            // gambar halaman daftar
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            // input email
            RoundedInputField(
              hintText: "Email",
              onChanged: (value) {},
            ),
            // input password
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            // button daftar
            RoundedButton(
              text: "DAFTAR",
              press: () {},
            ),
            // batas
            SizedBox(height: size.height * 0.03),
            // cek akun
            AlreadyHaveAnAccountCheck(
              login: false,
              // ke halaman login
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
            // teks ke halaman home
            TextButton(
              child: Text('Kembali ke Home'),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => WelcomeScreen()));
              },
            ),
            // pembatas
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // facebook
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                // twitter
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                // google
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}