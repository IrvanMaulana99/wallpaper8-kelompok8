// import
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper8_kelompok8/Screens/dashboard/dashboard.dart';

class VerifikasiScreen extends StatefulWidget {
  @override
  _VerifikasiScreenState createState() => _VerifikasiScreenState();
}

class _VerifikasiScreenState extends State<VerifikasiScreen> {
  // inisialisasi firebase & timer
  final auth = FirebaseAuth.instance;
  User user;
  Timer timer;

  @override
  void initState() {
    // kirim email untuk user
    user = auth.currentUser;
    user.sendEmailVerification();
    // 5 detik setelah verifikasi > fordward
    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // pemberitahuan email telah dikirim untuk verifikasi
      body: Center(
        child: Text(
            'Email telah dikirim ke ${user.email} mohon verifikasi emailnya, \nOtomatis redirect saat email sudah terverifikasi'),
      ),
    );
  }

  // fordward ke home jika telah verifikasi
  Future<void> checkEmailVerified() async {
    user = auth.currentUser;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Dashboard()));
    }
  }
}
