import 'package:flutter/material.dart';

import '../../Variabel/global.dart';

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
          color: Colors.white,
        ),
        title: const Text(
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
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                'Kata sandi Anda harus lebih dari enam karakter dan berisi angka.huruf, dan karakter khusus (!@%).',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Kata sandi saat ini',
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: SizedBox(
                        height: 40,
                        child: TextFormField(
                            decoration: const InputDecoration(
                                hintText: ' Kata sandi saat ini',
                                hintStyle: TextStyle(fontSize: 12.0),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: primaryColor)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: primaryColor)))),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Kata sandi baru',
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: SizedBox(
                        key: _formState,
                        height: 40,
                        child: TextFormField(
                            cursorColor: Colors.black,
                            controller: textController,
                            decoration: const InputDecoration(
                                hintText: 'Kata sandi baru',
                                hintStyle: TextStyle(fontSize: 12.0),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: primaryColor)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: primaryColor)))),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Ulang kata sandi baru',
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: SizedBox(
                        height: 40,
                        child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: const InputDecoration(
                                hintText: 'Ketik ulang kata sandi',
                                hintStyle: TextStyle(fontSize: 12.0),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: primaryColor)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: primaryColor)))),
                      ),
                    ),
                    const SizedBox(
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
                                  backgroundColor: primaryColor),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Simpan Kata Sandi')),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
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
