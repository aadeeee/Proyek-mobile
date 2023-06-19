import 'package:flutter/material.dart';
import 'package:mobile/component/Account/login.dart';
import 'package:mobile/component/Profil/myEditProfil.dart';
import 'package:mobile/component/Profil/pemeriksaKeamanan.dart';

class MyProfil extends StatefulWidget {
  const MyProfil({super.key});

  @override
  State<MyProfil> createState() => _MyProfilState();
}

class _MyProfilState extends State<MyProfil> {
  bool isSwitched = false;
  Color backgroundColor = Colors.white;

  void toggleSwitch(bool value) {
    setState(() {
      isSwitched = value;
      backgroundColor = isSwitched ? Colors.black : Colors.white;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFD61876E),
        title: Center(
          child: Text(
            "Toko Sejahtera",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 20.0),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 90.0, vertical: 20),
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Color(0xffFD61876E)),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 20,
                            color: Colors.black.withOpacity(0.1))
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/profile.jpg'),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Zeus",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Text(
                "zeus123@gmail.com",
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.grey))),
                      child: ListTile(
                        title: Text('Edit Profil'),
                        leading: const ImageIcon(AssetImage(
                          'assets/images/editprofile.png',
                        )),
                        iconColor: Colors.black,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyEditProfil()));
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.grey))),
                      child: ListTile(
                        title: Text('Kata Sandi'),
                        leading: const ImageIcon(
                            AssetImage('assets/images/keamanan.png')),
                        iconColor: Colors.black,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyPemeriksaKeamanan()));
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.grey))),
                      child: ListTile(
                        title: Text('Kalender'),
                        leading: const ImageIcon(
                            AssetImage('assets/images/kalender.png')),
                        iconColor: Colors.black,
                        onTap: () {
                          showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime(2030));
                        },
                      ),
                    ),
                    Container(
                      color: backgroundColor,
                      child: Center(
                        child: Switch(
                          value: isSwitched,
                          onChanged: toggleSwitch,
                          activeColor: Colors.black,
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xffFD61876E)),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Keluar dari akun Anda?"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context, false);
                                        },
                                        child: Text(
                                          'Batalkan',
                                          style: TextStyle(color: Colors.black),
                                        )),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => MyLogin()));
                                      },
                                      child: Text(
                                        'Keluar',
                                        style: TextStyle(
                                            color: Color(0xffFD61876E)),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        },
                        icon: Icon(Icons.logout),
                        label: Text(
                          "Keluar",
                          style: TextStyle(fontSize: 18),
                        ))),
              ),

              //
            ],
          ),
        ),
      ),
    );
  }
}
