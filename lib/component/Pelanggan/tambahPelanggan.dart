import 'package:flutter/material.dart';
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
  final List<String> _selectedProducts = [];
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
            title:
                const Text('Tambah pelanggan', style: TextStyle(fontSize: 20)),
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
                 Row(
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
                            if (value != null && value) {
                              _selectedProducts.add('Produk Lainnya');
                            } else {
                              _selectedProducts.remove('Produk Lainnya');
                            }
                          });
                        },
                      ),
                      if (_selectedProducts.contains('Produk Lainnya'))
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextField(
                            controller: _newProductController,
                            decoration: const InputDecoration(
                              labelText: 'Nama Produk Baru',
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: ElevatedButton(
                    onPressed: (_orderQuantity > 0 &&
                            prov.nameController.text.isNotEmpty &&
                            prov.phoneController.text.isNotEmpty &&
                            _selectedProducts.isNotEmpty &&
                            _selectedProducts.length <= _orderQuantity)
                        ? () {
                            if (_selectedProducts.contains('Produk Lainnya')) {
                              String newProduct =
                                  _newProductController.text.trim();
                              if (newProduct.isNotEmpty) {
                                prov.products.add(newProduct);
                                _selectedProducts.remove('Produk Lainnya');
                                _selectedProducts.add(newProduct);
                              }
                            }
                            prov.addCustomer(
                              prov.getNameController.text,
                              _orderQuantity,
                              prov.getPhoneController.text,
                              _selectedProducts,
                            );
                            prov.getNameController.clear();
                            prov.getPhoneController.clear();
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
