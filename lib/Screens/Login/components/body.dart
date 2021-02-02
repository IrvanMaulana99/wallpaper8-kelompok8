// import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpaper8_kelompok8/Screens/Login/components/background.dart';
import 'package:wallpaper8_kelompok8/Screens/Signup/signup_screen.dart';
import 'package:wallpaper8_kelompok8/Screens/Welcome/welcome_screen.dart';
import 'package:wallpaper8_kelompok8/Screens/dashboard/dashboard.dart';
import 'package:wallpaper8_kelompok8/Screens/reset%20password/reset.dart';
import 'package:wallpaper8_kelompok8/components/cek_akun.dart';
import 'package:wallpaper8_kelompok8/components/rounded_button.dart';
import 'package:wallpaper8_kelompok8/components/rounded_input_field.dart';
import 'package:wallpaper8_kelompok8/components/rounded_password_field.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

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
              "Halaman Login",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            // batas
            SizedBox(height: size.height * 0.03),
            // gambar halaman login
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            // batas
            SizedBox(height: size.height * 0.03),
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
            // button login
            RoundedButton(
              text: "LOGIN",
              press: () {
                auth
                    .signInWithEmailAndPassword(
                        email: _email, password: _password)
                    .then((_) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Dashboard()));
                });
              },
            ),
            // batas
            SizedBox(height: size.height * 0.03),
            // cek akun
            AlreadyHaveAnAccountCheck(
              // ke halaman daftar
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
            // teks ke halaman awal
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  child: Text('Kembali ke Home'),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WelcomeScreen()));
                  },
                ),
                // teks untuk ke halaman reset password
                TextButton(
                  child: Text('Lupa Password'),
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ResetScreen())),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
