import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../Provider/pelangganProvider.dart';
import '../../Variabel/global.dart';

class AddCustomerDialog extends StatefulWidget {
  const AddCustomerDialog({super.key});

  @override
  State<AddCustomerDialog> createState() => _AddCustomerDialogState();
}

class _AddCustomerDialogState extends State<AddCustomerDialog> {
  final Set<String> _selectedProducts = {};
  final List<String> _additionalProducts = [];
  final TextEditingController _newProductController = TextEditingController();
  int _orderQuantity = 0;

  @override
  void dispose() {
    _newProductController.dispose();
    super.dispose();
  }

  void _updateOrderQuantity(String value) {
    setState(() {
      _orderQuantity = int.tryParse(value) ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<CustomerProvider>(context);
    return Scrollbar(
      child: Dialog(
        insetPadding: EdgeInsets.zero,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor,
            title: Text('Tambah pelanggan', style: GoogleFonts.inter()),
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                SizedBox(
                  child: Image.asset(
                    'assets/images/addpelanggan.png',
                    height: 200,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  cursorColor: Colors.black,
                  controller: prov.nameController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person, color: primaryColor, size: 30),
                    labelText: 'Nama Pelanggan',
                  ),
                ),
                TextField(
                  cursorColor: Colors.black,
                  controller: prov.phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.phone, color: primaryColor, size: 30),
                    labelText: 'Telepon',
                  ),
                ),
                TextField(
                  cursorColor: Colors.black,
                  onChanged: _updateOrderQuantity,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.post_add_rounded,
                      color: primaryColor,
                      size: 30,
                    ),
                    labelText: 'Jumlah Pesanan',
                  ),
                ),
                const Divider(),
                const Row(
                  children: [
                    Text(
                      'Daftar Produk',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ScrollablePositionedList.builder(
                        shrinkWrap: true,
                        itemCount: prov.products.length,
                        itemBuilder: (context, index) {
                          final product = prov.products[index];
                          final isProductSelected =
                              _selectedProducts.contains(product);

                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            child: CheckboxListTile(
                              activeColor: primaryColor,
                              title: Text(
                                product,
                              ),
                              value: isProductSelected,
                              onChanged: (bool? value) {
                                setState(() {
                                  if (value != null && value) {
                                    _selectedProducts.add(product);
                                  } else {
                                    _selectedProducts.remove(product);
                                  }
                                });
                              },
                            ),
                          );
                        },
                      ),
                      CheckboxListTile(
                        activeColor: primaryColor,
                        title: const Text('Produk Lainnya'),
                        value: _selectedProducts.contains('Produk Lainnya'),
                        onChanged: (bool? value) {
                          setState(() {
                            if (value != null) {
                              if (value) {
                                _selectedProducts.add('Produk Lainnya');
                              } else {
                                _selectedProducts.remove('Produk Lainnya');
                                _additionalProducts.clear();
                              }
                            }
                          });
                        },
                      ),
                      if (_selectedProducts.contains('Produk Lainnya'))
                        Column(
                          children: [
                            for (int i = 0; i < _additionalProducts.length; i++)
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text(_additionalProducts[i])),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _additionalProducts.removeAt(i);
                                        });
                                      },
                                      icon: Icon(Icons.delete),
                                    ),
                                  ],
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextField(
                                controller: _newProductController,
                                decoration: const InputDecoration(
                                  labelText: 'Produk Baru',
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    String newProduct =
                                        _newProductController.text.trim();
                                    if (newProduct.isNotEmpty) {
                                      setState(() {
                                        _additionalProducts.add(newProduct);
                                        _newProductController.clear();
                                      });
                                    }
                                  },
                                  child: const Text(
                                    'Tambah',
                                    style: TextStyle(color: primaryColor),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: ElevatedButton(
                    onPressed: (_orderQuantity > 0 &&
                            prov.nameController.text.isNotEmpty &&
                            prov.phoneController.text.isNotEmpty)
                        ? () {
                            if (_selectedProducts.contains('Produk Lainnya')) {
                              String newProduct =
                                  _newProductController.text.trim();
                              if (newProduct.isNotEmpty) {
                                _additionalProducts.add(newProduct);
                                _newProductController.clear();
                              }
                            }
                            List<String> allSelectedProducts = [
                              ..._selectedProducts,
                              ..._additionalProducts
                            ];
                            if (allSelectedProducts.length != _orderQuantity) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Harap lengkapi data dengan benar!!!'),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                              return;
                            }

                            prov.addCustomer(
                              prov.nameController.text,
                              _orderQuantity,
                              prov.phoneController.text,
                              allSelectedProducts,
                            );
                            prov.nameController.clear();
                            prov.phoneController.clear();
                            Navigator.of(context).pop();
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Tambah',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
