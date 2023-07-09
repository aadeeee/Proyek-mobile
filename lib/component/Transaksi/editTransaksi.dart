import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../Provider/transaksiProvider.dart';
import '../../Variabel/global.dart';

class MyEditTransaction extends StatefulWidget {
  const MyEditTransaction({super.key});

  @override
  State<MyEditTransaction> createState() => _MyEditTransactionState();
}

class _MyEditTransactionState extends State<MyEditTransaction> {
  int _selectedIndex = 1;
  DateTime? _selectedDate;
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<TransactionProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Ubah Transaksi"),
          backgroundColor: primaryColor,
        ),
        body: Column(
          children: [
            SizedBox(
                child: Image.asset(
              'assets/images/addtransaksi.png',
              height: 250,
            )),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: prov.getNamaController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person, color: primaryColor, size: 30),
                  labelText: 'Nama pelanggan',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: prov.getJumlahController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.credit_card, color: primaryColor, size: 30),
                  labelText: 'Jumlah Transaksi',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: prov.getTanggalController,
                readOnly: true,
                onTap: () {
                  showDatePicker(
                    cancelText: "Batal",
                    confirmText: 'Pilih',
                    context: context,
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: ThemeData(
                          colorScheme: const ColorScheme.light(
                            primary: primaryColor,
                          ),
                        ),
                        child: child ?? const Text(""),
                      );
                    },
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2024),
                  ).then((selectedDate) {
                    if (selectedDate != null) {
                      setState(() {
                        _selectedDate = selectedDate;
                        prov.getTanggalController.text =
                            DateFormat('yyyy/MM/dd').format(selectedDate);
                      });
                    }
                  });
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_month_outlined,
                      color: primaryColor, size: 30),
                  labelText: 'Pilih Tanggal',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  final data = {
                    'nama': prov.getNamaController.text,
                    'jumlah': double.parse(prov.getJumlahController.text),
                    'tanggal': _selectedDate ?? DateTime.now(),
                  };
                  if (_selectedIndex != -1) {
                    prov.editTransaction(_selectedIndex, data);
                  }
                  prov.getNamaController.clear();
                  prov.getJumlahController.clear();
                  prov.getTanggalController.clear();
                  setState(() {
                    _selectedIndex = -1;
                  });
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Simpan Perubahan',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
