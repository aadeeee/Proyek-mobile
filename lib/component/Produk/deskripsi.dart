import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../Variabel/global.dart';

class MyDescription extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final data;
  const MyDescription({super.key, required this.data});

  @override
  State<MyDescription> createState() => _MyDescriptionState();
}

class _MyDescriptionState extends State<MyDescription> {
  final rupiahFormat =
      NumberFormat.currency(locale: 'ID', symbol: "", decimalDigits: 0);
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
          "Detail Produk",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Image.asset(
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
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
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
                                  fontSize: 18, fontWeight: FontWeight.bold),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Kode item : ',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Text(
                                widget.data['code'],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Jumlah stok : ',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text("${widget.data['stock']}")
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Deskripsi : ',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        widget.data['description'],
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
