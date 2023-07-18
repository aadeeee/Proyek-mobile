import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Variabel/global.dart';

class MyDescription extends StatefulWidget {
  final dynamic data;
  final File? imageFile;

  const MyDescription({
    Key? key,
    required this.data,
    required this.imageFile,
  }) : super(key: key);

  @override
  State<MyDescription> createState() => _MyDescriptionState();
}

class _MyDescriptionState extends State<MyDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: BackButton(
          onPressed: () => Navigator.pop(context, false),
          color: Colors.white,
        ),
        title: Text("Detail Produk", style: GoogleFonts.inter()),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(color: primaryColor),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: widget.imageFile != null
                    ? Image.file(
                        widget.imageFile!,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        widget.data['imageUrl'],
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                constraints: const BoxConstraints(minHeight: 305),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 199, 230, 211),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text(
                              widget.data['name'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Rp. ${rupiahFormat.format(widget.data['price'])}",
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        indent: 5,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          width: 300,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Kode item : ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    widget.data['code'],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Jumlah stok : ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  Text("${widget.data['stock']}")
                                ],
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Deskripsi : ',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.data['description'],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
