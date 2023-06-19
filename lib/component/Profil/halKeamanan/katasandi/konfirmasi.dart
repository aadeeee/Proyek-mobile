
import 'package:flutter/material.dart';
import 'package:mobile/component/Profil/profil.dart';

class MyConfirKataSandi extends StatefulWidget {
  const MyConfirKataSandi({super.key});

  @override
  State<MyConfirKataSandi> createState() => _MyConfirKataSandiState();
}

class _MyConfirKataSandiState extends State<MyConfirKataSandi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffFD61876E),
          leading: BackButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyProfil()));
            },
            // Icons.arrow_back,
            color: Colors.white,
          ),
          title: Text(
            "Dikonfirmasi",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: 'Inter',
            ),
          ),
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Center(
            child: Column(children: [
              SizedBox(
                  child: Image.asset(
                'assets/images/konfirmasi.png',
                height: 300,
              )),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  'Kata Sandi Anda telah diperbarui',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  'Anda dapat mengedit kata sandi Anda di keamanan',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ]),
          ),
        ));
  }
}