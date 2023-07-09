import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../Provider/transaksiProvider.dart';
import '../../Variabel/global.dart';

class MyAddTransactions extends StatefulWidget {
  const MyAddTransactions({super.key});

  @override
  State<MyAddTransactions> createState() => _MyAddTransactionsState();
}

class _MyAddTransactionsState extends State<MyAddTransactions> {
  int _selectedIndex = 1;
  DateTime? _selectedDate;
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<TransactionProvider>(context);
    return FloatingActionButton(
      backgroundColor: primaryColor,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              insetPadding: EdgeInsets.zero,
              child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: primaryColor,
                    title: Text('Tambah Transaksi', style: GoogleFonts.inter()),
                    centerTitle: true,
                    automaticallyImplyLeading: false,
                    leading: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                    ),
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
                            icon: Icon(Icons.person,
                                color: primaryColor, size: 30),
                            labelText: 'Nama pelanggan',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: prov.getJumlahController,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.credit_card,
                                color: primaryColor, size: 30),
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
                                  prov.getTanggalController.text =
                                      DateFormat('yyyy/MM/dd')
                                          .format(selectedDate);
                                });
                              }
                            });
                          },
                          decoration: const InputDecoration(
                            focusColor: primaryColor,
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
                            if (prov.getNamaController.text.isEmpty ||
                                prov.getJumlahController.text.isEmpty ||
                                prov.getTanggalController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Harap lengkapi data dengan benar!!!'),
                                ),
                              );
                              return;
                            }

                            final data = {
                              'nama': prov.getNamaController.text,
                              'jumlah':
                                  double.parse(prov.getJumlahController.text),
                              'tanggal': _selectedDate ?? DateTime.now(),
                            };
                            if (_selectedIndex == 1) {
                              prov.addTransaction(data);
                            }

                            prov.getNamaController.clear();
                            prov.getJumlahController.clear();
                            prov.getTanggalController.clear();
                            setState(() {
                              _selectedIndex = 1;
                              _selectedDate = null;
                            });
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Simpan Transaksi',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            );
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
