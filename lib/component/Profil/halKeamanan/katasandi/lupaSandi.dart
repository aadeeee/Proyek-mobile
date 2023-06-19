
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:mobile/component/Profil/halKeamanan/katasandi/kodeOtpKataSandi.dart';

class LupaKataSandi extends StatefulWidget {
  const LupaKataSandi({super.key});

  @override
  State<LupaKataSandi> createState() => _LupaKataSandiState();
}

class _LupaKataSandiState extends State<LupaKataSandi> {
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
        ),
        body: SingleChildScrollView(
          reverse: true,
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  'Lupa Kata Sandi ?',
                  // textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  'Reset kata sandi dalam dua langkah cepat',
                  // textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Email atau Nomor Handphone',
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: SizedBox(
                          // width: 300,
                          height: 40,
                          child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: 'zeus@gmail.com',
                                  hintStyle: TextStyle(fontSize: 12.0),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffFD61876E))),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffFD61876E))))),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: Column(
                        children: [
                          SizedBox(
                            width: 300,
                            height: 50,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Color(0xffFD61876E)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MyOtpKataSandi()));
                                },
                                child: Text('Reset Kata Sandi')),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context, false);
                              },
                              child: Text(
                                'Kembali',
                                style: TextStyle(color: Color(0xffFD61876E)),
                              ))
                        ],
                      )),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
