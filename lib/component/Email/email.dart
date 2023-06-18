import 'package:flutter/material.dart';
import 'package:mobile/Provider/emailProvider.dart';
import 'package:mobile/component/Email/email_succes.dart';
import 'package:provider/provider.dart';

class MyEmail extends StatefulWidget {
  const MyEmail({super.key});

  @override
  State<MyEmail> createState() => _MyEmailState();
}

class _MyEmailState extends State<MyEmail> {
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyEmailProvider>(context);
    return Scaffold(
        body: ListView(
      padding: const EdgeInsets.only(
          top: 40, left: 20, right: 20), 
      children: [
        const Text(
          'Silahkan Aktivasi\nAkun Anda!',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10, bottom: 25),
          child: Text(
            'Sebelum Anda masuk, Anda harus mengaktivasi akun Anda dengan kode yang sudah dikirimkan ke alamat email Anda',
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        const Text(
          'Kode',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: TextField(
            controller: prov.codeController,
            cursorColor: Colors.black,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.black)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                fillColor: Colors.black,
                hintText: "Masukkan kode Anda disini",
                errorText: prov.isCodeEmpty == true ? "wajib diisi" : null),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(0),
          child: ElevatedButton(
            onPressed: () {
              prov.codeEmpty = prov.codeController.text.isEmpty;
              prov.codeController.clear();

              if (!prov.isCodeEmpty) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const EmailSuccess()));
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffFD61876E),
                minimumSize: const Size.fromHeight(60),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            child: const Text(
              "AKTIVASI AKUN",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    ));
  }
}
