import 'package:flutter/material.dart';
import 'package:mobile/component/Profil/halPengaturan/bahasa.dart';

import '../../../Variabel/global.dart';

class MyPengaturan extends StatefulWidget {
  const MyPengaturan({super.key});

  @override
  State<MyPengaturan> createState() => _MyPengaturanState();
}

class _MyPengaturanState extends State<MyPengaturan> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: BackButton(
          onPressed: () => Navigator.pop(context, false),
          color: Colors.white,
        ),
        title: Text(
          "Pengaturan",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontFamily: 'Inter',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey))),
                child: ListTile(
                  title: Text('Tema'),
                  leading: const ImageIcon(
                      size: 30, AssetImage('assets/images/icontema.png')),
                  iconColor: Colors.black,
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Pilih Tema"),
                            actions: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                          value: 1,
                                          groupValue: _value,
                                          onChanged: (value) {}),
                                      Text('Default')
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                          value: 2,
                                          groupValue: _value,
                                          onChanged: (value) {}),
                                      Text('Gelap')
                                    ],
                                  )
                                ],
                              )
                            ],
                          );
                        });
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey))),
                child: ListTile(
                  title: Text('Bahasa'),
                  leading: const ImageIcon(
                      size: 30, AssetImage('assets/images/iconbahasa.png')),
                  iconColor: Colors.black,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyBahasa()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
