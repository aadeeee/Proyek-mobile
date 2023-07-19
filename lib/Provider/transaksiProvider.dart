import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _transactions = [
    {'nama': "Budi", 'jumlah': 365000, 'tanggal': DateTime(2024, 6, 28)},
    {
      'nama': "Chris",
      'jumlah': 250000,
      'tanggal': DateTime(2023, 6, 1),
    },
  ];

  TextEditingController _namaController = TextEditingController();
  TextEditingController _jumlahController = TextEditingController();
  TextEditingController _tanggalController = TextEditingController();
  TextEditingController get getNamaController => _namaController;
  TextEditingController get getJumlahController => _jumlahController;
  TextEditingController get getTanggalController => _tanggalController;

  List<Map<String, dynamic>> get transactions => _transactions;

  void addTransaction(Map<String, dynamic> transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }

  void editTransaction(int index, Map<String, dynamic> transaction) {
    _transactions[index] = transaction;
    notifyListeners();
  }

  void deleteTransaction(int index) {
    _transactions.removeAt(index);
    notifyListeners();
  }

  List<Map<String, dynamic>> searchTransactionByDate(DateTime date) {
    return _transactions
        .where((transaction) =>
            DateFormat('dd/MM/yyyy').format(transaction['tanggal']) ==
            DateFormat('dd/MM/yyyy').format(date))
        .toList();
  }
}
