
import 'package:flutter/material.dart';
import 'package:mobile/component/Profil/profil.dart';

import '../../../../Variabel/global.dart';

class MyConfirNohp extends StatefulWidget {
  const MyConfirNohp({super.key});

  @override
  State<MyConfirNohp> createState() => _MyConfirNohpState();
}

class _MyConfirNohpState extends State<MyConfirNohp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          leading: BackButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyProfil()));
            },
            // Icons.arrow_back,
            color: Colors.white,
          ),
          title: Text(
            "Dikonfirmasi",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
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
                  'Nomor Handphone Anda telah diperbarui',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  'Anda dapat mengedit nomor handphone Anda di keamanan',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ]),
          ),
        ));
  }
}
