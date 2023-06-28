import 'package:flutter/material.dart';

import '../../../../Variabel/global.dart';

class MyKataSandi extends StatefulWidget {
  const MyKataSandi({super.key});

  @override
  State<MyKataSandi> createState() => _MyKataSandiState();
}

class _MyKataSandiState extends State<MyKataSandi> {
  final _formState = GlobalKey<FormState>();
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: BackButton(
          onPressed: () => Navigator.pop(context, false),
          // Icons.arrow_back,
          color: Colors.white,
        ),
        title: Text(
          "Kata Sandi",
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
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                'Kata sandi Anda harus lebih dari enam karakter dan berisi angka.huruf, dan karakter khusus (!@%).',
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
                        'Kata sandi saat ini',
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
                                hintText: ' Kata sandi saat ini',
                                hintStyle: TextStyle(fontSize: 12.0),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: primaryColor)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: primaryColor)))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Kata sandi baru',
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: SizedBox(
                        // width: 300,
                        key: _formState,
                        height: 40,
                        child: TextFormField(
                            controller: textController,
                            validator: (value) {
                              if (value == '') {
                                return "Text tidak boleh kosong";
                              }
                            },
                            decoration: InputDecoration(
                                hintText: 'Kata sandi baru',
                                hintStyle: TextStyle(fontSize: 12.0),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: primaryColor)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: primaryColor)))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Ulang kata sandi baru',
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
                                hintText: 'Ketik ulang kata sandi',
                                hintStyle: TextStyle(fontSize: 12.0),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: primaryColor)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: primaryColor)))),
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
                                  primary: primaryColor),
                              onPressed: () {
                                if (_formState.currentState!.validate()) {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             LupaKataSandi()));
                                }
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             LupaKataSandi()));
                              },
                              child: Text('Simpan Kata Sandi')),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Lupa kata sandi',
                              style: TextStyle(color: primaryColor),
                            ))
                      ],
                    )),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
