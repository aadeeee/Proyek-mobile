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
          title: Text("Ubah Transaksi"),
          backgroundColor: primaryColor,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: prov.getNamaController,
                decoration: InputDecoration(
                  labelText: 'Nama pelanggan',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: prov.getJumlahController,
                decoration: InputDecoration(
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
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2024),
                  ).then((selectedDate) {
                    if (selectedDate != null) {
                      setState(() {
                        _selectedDate=selectedDate;
                        prov.getTanggalController.text = DateFormat('yyyy/MM/dd').format(selectedDate);
                      });
                    }
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Pilih Tanggal',
                ),
              ),
            ),
            ElevatedButton(
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
              child: Text('Simpan Perubahan'),
            ),
          ],
        ));
  }
}
