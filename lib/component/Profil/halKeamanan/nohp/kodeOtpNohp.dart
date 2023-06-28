import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:mobile/component/Profil/halKeamanan/nohp/konfirmasi.dart';

import '../../../../Variabel/global.dart';

class MyOTPNohp extends StatefulWidget {
  const MyOTPNohp({super.key});

  @override
  State<MyOTPNohp> createState() => _MyOTPNohpState();
}

class _MyOTPNohpState extends State<MyOTPNohp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              backgroundColor: primaryColor,
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
                  'Masukkan kode 4 digit yang kami kirim ke zeus123@gmail.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Kirim ulang kode',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: primaryColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: OtpTextField(
                  numberOfFields: 5,
                  borderColor: primaryColor,
                  showFieldAsBox: true,

                  onCodeChanged: (String code) {},

                  onSubmit: (String verificationCode) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Kode berhasil"),
                          );
                        });
                  }, // end onSubmit
                ),
              ),
              Center(
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: primaryColor),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyConfirNohp()));
                      },
                      child: Text('Berikutnya')),
                ),
              ),
            ]),
          )),
    );
  }
}
