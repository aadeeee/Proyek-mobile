import 'package:flutter/material.dart';
import 'package:mobile/component/home.dart';

class EmailSuccess extends StatefulWidget {
  const EmailSuccess({super.key});

  @override
  State<EmailSuccess> createState() => _EmailSuccessState();
}

class _EmailSuccessState extends State<EmailSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.only(top: 40, left: 20, right: 20),
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Image.asset(
            'assets/images/email_succes.png',
            height: 300,
            width: 400,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Text(
            'Selamat, akun\nAnda berhasil di\naktivasi',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.purple[700]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20 ,top: 10, bottom: 25),
          child: Text(
            'Akun Anda sudah diaktivasi dengan verifikasi kode melalui email',
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => const MyHome()));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                minimumSize: const Size.fromHeight(60),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            child: const Text(
              "SELANJUTNYA",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    ));
  }
}
