// import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper8_kelompok8/Screens/Login/login_screen.dart';

class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  // inisialisasi variabel email dan Firebase auth
  String _email;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // judul appbar
      appBar: AppBar(
        title: Text('Setel Ulang Password'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            // teksfield input email
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(hintText: 'Email'),
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton(
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'Kirim Permintaan Reset',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    auth.sendPasswordResetEmail(email: _email);
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
