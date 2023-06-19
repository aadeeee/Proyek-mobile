
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:mobile/component/Profil/halKeamanan/katasandi/konfirmasi.dart';

class MyOtpKataSandi extends StatefulWidget {
  const MyOtpKataSandi({super.key});

  @override
  State<MyOtpKataSandi> createState() => _MyOtpKataSandiState();
}

class _MyOtpKataSandiState extends State<MyOtpKataSandi> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              backgroundColor: Color(0xffFD61876E),
              leading: BackButton(
                onPressed: () => Navigator.pop(context, false),
                // Icons.arrow_back,
                color: Colors.white,
              )),
          body: SingleChildScrollView(
            reverse: true,
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
            child: Column(children: [
              SizedBox(
                  child: Image.asset(
                'assets/images/otp.png',
                height: 200,
              )),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  'Masukkan kode',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  'Masukkan kode reset yang kami SMS ke nomor    +628123456789',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Kirim ulang kode',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Color(0xffFD61876E)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: OtpTextField(
                  numberOfFields: 5,
                  borderColor: Color(0xffFD61876E),
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {
                  },

                  onSubmit: (String verificationCode) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Kode berhasil"),
                          );
                        });
                  }, 
                ),
              ),
              Center(
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xffFD61876E)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyConfirKataSandi()));
                      },
                      child: Text('Berikutnya')),
                ),
              ),
            ]),
          )),
    );
  }
}
