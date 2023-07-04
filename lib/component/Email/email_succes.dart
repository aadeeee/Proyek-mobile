import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/component/Account/login.dart';

import '../../Variabel/global.dart';

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
      padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
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
            
            style: GoogleFonts.inter(fontSize: 30, fontWeight: FontWeight.bold)
            
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20 ,top: 10, bottom: 25),
          child: Text(
            'Akun Anda sudah diaktivasi dengan verifikasi kode melalui email',
            style: GoogleFonts.inter(fontSize: 16)
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: ElevatedButton(
            onPressed: () {
              
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) =>  const MyLogin()));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                minimumSize: const Size.fromHeight(60),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            child:  Text(
              "SELANJUTNYA",
              style: GoogleFonts.inter(fontSize: 20)
            ),
          ),
        ),
      ],
    ));
  }
}
