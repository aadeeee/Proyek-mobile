import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/Provider/profilProvider.dart';
import 'package:provider/provider.dart';

import '../../Variabel/global.dart';

class MyEditProfil extends StatefulWidget {
  const MyEditProfil({super.key});

  @override
  State<MyEditProfil> createState() => _MyEditProfilState();
}

class _MyEditProfilState extends State<MyEditProfil> {
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<ProfilProvider>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text('Ubah Profil'), 
          backgroundColor: primaryColor)
          ,
      body: SingleChildScrollView(
        child: Column(
        children: [
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 90.0, vertical: 20),
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    border: Border.all(width: 4, color: primaryColor),
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
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            child: TextField(
                controller: prov.namaPemilikTokoController,
                
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  fillColor: Colors.black,
                  label: Text(
                    "Nama Pemilik Toko",
                    style: GoogleFonts.inter(color: primaryColor),
                  ),
                )),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            child: TextField(
                controller: prov.namaTokoController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  fillColor: Colors.black,
                  label: Text(
                    "Nama Toko",
                    style: GoogleFonts.inter(color: primaryColor),
                  ),
                )),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            child: TextField(
                controller: prov.alamatTokoController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  fillColor: Colors.black,
                  label: Text(
                    "Alamat Toko",
                    style: GoogleFonts.inter(color: primaryColor),
                  ),
                )),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            child: TextField(
                controller: prov.kategoriController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  fillColor: Colors.black,
                  label: Text(
                    "Kategori Toko",
                    style: GoogleFonts.inter(color: primaryColor),
                  ),
                )),
          ),
          Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
          child: ElevatedButton(
            onPressed: () {
              String newNamaPemilikToko = prov.namaPemilikTokoController.text;
              String newNamaToko = prov.namaTokoController.text;
              String newAlamatToko = prov.alamatTokoController.text;
              String newKategori = prov.kategoriController.text;

              prov.updateProfile(newNamaPemilikToko, newNamaToko, newAlamatToko, newKategori);
   
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Simpan',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
          ),
        ),
        ],
      ),
      )
      
    );
  }
}
