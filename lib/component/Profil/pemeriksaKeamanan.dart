import 'package:flutter/material.dart';
import 'package:mobile/component/Profil/kataSandi.dart';

import '../../Variabel/global.dart';

class MyPemeriksaKeamanan extends StatelessWidget {
  const MyPemeriksaKeamanan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          leading: BackButton(
            onPressed: () => Navigator.pop(context, false),
            color: Colors.white,
          ),
          centerTitle: true,
          title: const Text(
            "Pemeriksa Keamanan",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
          child: Column(
            children: [
              SizedBox(
                  child: Image.asset(
                'assets/images/pemeriksakeamanan.png',
                height: 200,
              )),
              const Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Text(
                  'Bantu amankan akun Anda',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  'Kami sarankan untuk meminjau info Anda dan menambahkan perlindungan login ekstra ke akun Anda. Info yang akurat akan mempermudah kami untuk membantu anda jika terjadi masalah keamanan',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              const Divider(),
              ListTile(
                title: const Text('Kata sandi'),
                subtitle: const Text('Ubah kata sandi'),
                trailing: const Icon(Icons.keyboard_arrow_right),
                leading: const ImageIcon(
                    size: 30, AssetImage('assets/images/keamanan.png')),
                iconColor: Colors.black,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MyKataSandi()));
                },
              ),
            ],
          ),
        ));
  }
}
