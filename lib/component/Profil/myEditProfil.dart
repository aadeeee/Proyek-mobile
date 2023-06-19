import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/component/Profil/profil.dart';

class MyEditProfil extends StatefulWidget {
  const MyEditProfil({super.key});

  @override
  State<MyEditProfil> createState() => _MyEditProfilState();
}

class _MyEditProfilState extends State<MyEditProfil> {
  String? selectedValue;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffFD61876E),
          leading: BackButton(
            onPressed: () => Navigator.pop(context, false),
            // Icons.arrow_back,
            color: Colors.white,
          ),
          title: Text(
            "Edit Profil",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: 'Inter',
            ),
          ),
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Center(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 90.0, vertical: 20),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 4, color: Color(0xffFD61876E)),
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
                Container(
                  margin: EdgeInsets.only(top: 170.0),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nama Pemilik',
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.w500),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: SizedBox(
                                width: 300,
                                height: 40,
                                child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: 'Nama Pemilik',
                                        hintStyle: TextStyle(fontSize: 12.0),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffFD61876E))),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffFD61876E))))),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Text(
                                'Nama Toko',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: SizedBox(
                                width: 300,
                                height: 40,
                                child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: 'Nama Toko',
                                        hintStyle: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffFD61876E))),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffFD61876E))))),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Text(
                                'Alamat Toko',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: SizedBox(
                                width: 300,
                                height: 40,
                                child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: 'Alamat Toko',
                                        hintStyle: TextStyle(fontSize: 12.0),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffFD61876E))),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffFD61876E))))),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Text(
                                  'Kategori',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                width: 300,
                                height: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      style: BorderStyle.solid,
                                      color: Color(0xffFD61876E)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                child: DropdownButton<String?>(
                                  value: selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value;
                                    });
                                  },
                                  hint: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Pilih Kategori',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  isExpanded: true,
                                  underline: SizedBox(),
                                  items: [
                                    'Toko Kelontong',
                                    'Pakaian',
                                    'Minuman',
                                    'Makanan',
                                    'Aksesoris'
                                  ]
                                      .map<DropdownMenuItem<String?>>((e) =>
                                          DropdownMenuItem(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                e.toString(),
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ),
                                            value: e,
                                          ))
                                      .toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 70.0),
                        child: SizedBox(
                          width: 300,
                          height: 50,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xffFD61876E)),
                              onPressed: () {
                                Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyProfil()));
                              },
                              child: Text('Simpan')),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    
  }
}
