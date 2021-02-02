// import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpaper8_kelompok8/Screens/Login/login_screen.dart';
import 'package:wallpaper8_kelompok8/Screens/Signup/components/background.dart';
import 'package:wallpaper8_kelompok8/Screens/Welcome/welcome_screen.dart';
import 'package:wallpaper8_kelompok8/Screens/verifikasi%20email/verifikasi.dart';
import 'package:wallpaper8_kelompok8/components/cek_akun.dart';
import 'package:wallpaper8_kelompok8/components/rounded_button.dart';
import 'package:wallpaper8_kelompok8/components/rounded_input_field.dart';
import 'package:wallpaper8_kelompok8/components/rounded_password_field.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String _email, _password;
  final auth = FirebaseAuth.instance;

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
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
            // input password
            RoundedPasswordField(
              onChanged: (value) {
                setState(() {
                  _password = value.trim();
                });
              },
            ),
            // button daftar
            RoundedButton(
              text: "DAFTAR",
              press: () {
                auth
                    .createUserWithEmailAndPassword(
                        email: _email, password: _password)
                    .then((_) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => VerifikasiScreen()));
                });
              },
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
          ],
        ),
      ),
    );
  }
}
