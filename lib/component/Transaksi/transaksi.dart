import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mobile/Provider/transaksiProvider.dart';
import 'package:mobile/Variabel/global.dart';
import 'package:provider/provider.dart';
import 'package:mobile/component/Transaksi/editTransaksi.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  final rupiahFormat =
      NumberFormat.currency(locale: 'ID', symbol: "", decimalDigits: 0);
  int _selectedIndex = 1;
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<TransactionProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Transaksi'),
        backgroundColor: primaryColor,
      ),
      body: ListView.builder(
        itemCount: prov.transactions.length,
        itemBuilder: (ctx, index) {
          final transaction = prov.transactions[index];
          return ListTile(
            title: Text(transaction['nama']),
            isThreeLine: true,
            subtitle: Text(
                'Rp. ${rupiahFormat.format(transaction['jumlah'])}\n${DateFormat('yyyy/MM/dd').format(transaction['tanggal'])}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    prov.getNamaController.text = transaction['nama'];
                    prov.getJumlahController.text =
                        transaction['jumlah'].toString();
                    final transactionDate = transaction['tanggal'] as DateTime;
                    final formattedDate =
                        DateFormat('yyyy/MM/dd').format(transactionDate);
                    prov.getTanggalController.text = formattedDate;
                    setState(() {
                      _selectedIndex = index;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => MyEditTransaction()));
                    });
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    prov.deleteTransaction(index);
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffFD61876E),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                insetPadding: EdgeInsets.zero,
                child: Scaffold(
                    appBar: AppBar(
                      backgroundColor: Color(0xffFD61876E),
                      title:
                          Text('Tambah Transaksi', style: GoogleFonts.inter()),
                      centerTitle: false,
                      automaticallyImplyLeading: false,
                      leading: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.close),
                      ),
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
                                    prov.getTanggalController.text =
                                        DateFormat('yyyy/MM/dd')
                                            .format(selectedDate);
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
                          child: Text('Simpan Transaksi'),
                        ),
                      ],
                    )),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
