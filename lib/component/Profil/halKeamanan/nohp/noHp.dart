
import 'package:flutter/material.dart';
import 'package:mobile/component/Profil/halKeamanan/nohp/kodeOtpNohp.dart';

class MyNohp extends StatefulWidget {
  const MyNohp({super.key});

  @override
  State<MyNohp> createState() => _MyNohpState();
}

class _MyNohpState extends State<MyNohp> {
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
          ),
          title: Text(
            "Nomor Handphone",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: 'Inter',
            ),
          ),
        ),
        body: SingleChildScrollView(
          reverse: true,
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
          child: Column(
            children: [
              SizedBox(
                  child: Image.asset(
                'assets/images/no hp.png',
                height: 200,
              )),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  'Perbarui Nomor Hp Anda',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  'Apakah nomor anda masih +6282378992365?     Pastikan detail kontak anda benar. ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Perbarui Nomor handphone anda jika diperlukan dan kami akan mengirimkan kode konfirmasi kepada anda.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nomor Handphone'),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: 'Masukkan nomor anda',
                              hintStyle: TextStyle(fontSize: 13),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffFD61876E))),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffFD61876E)))),
                          onChanged: (value) {},
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
                                        builder: (context) => MyOTPNohp()));
                              },
                              child: Text('Berikutnya')),
                        ),
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
