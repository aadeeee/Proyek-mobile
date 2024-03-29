import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mobile/Provider/transaksiProvider.dart';
import 'package:mobile/Variabel/global.dart';
import 'package:mobile/component/Transaksi/tambahTransaksi.dart';
import 'package:provider/provider.dart';
import 'package:mobile/component/Transaksi/editTransaksi.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<TransactionProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Transaksi', style: GoogleFonts.inter())),
          backgroundColor: primaryColor,
        ),
        body: ListView.builder(
          itemCount: prov.transactions.length,
          itemBuilder: (ctx, index) {
            final transaction = prov.transactions[index];
            return Column(
              children: [
                ListTile(
                  title: Text(transaction['nama']),
                  isThreeLine: true,
                  subtitle: Text(
                      'Rp. ${rupiahFormat.format(transaction['jumlah'])}\n${DateFormat('dd/MM/yyyy').format(transaction['tanggal'])}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.green,
                        ),
                        onPressed: () {
                          prov.getNamaController.text = transaction['nama'];
                          prov.getJumlahController.text =
                              transaction['jumlah'].toString();
                          final transactionDate =
                              transaction['tanggal'] as DateTime;
                          final formattedDate =
                              DateFormat('dd/MM/yyyy').format(transactionDate);
                          prov.getTanggalController.text = formattedDate;
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    MyEditTransaction(selectedIndex: index),
                              ),
                            );
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          prov.deleteTransaction(index);
                        },
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: primaryColor,
                )
              ],
            );
          },
        ),
        floatingActionButton: MyAddTransactions());
  }
}
