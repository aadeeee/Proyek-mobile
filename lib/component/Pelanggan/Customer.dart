import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/Provider/pelangganProvider.dart';
import 'package:mobile/Provider/produkprovider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class MyCustomerList extends StatefulWidget {
  @override
  _MyCustomerListState createState() => _MyCustomerListState();
}

class _MyCustomerListState extends State<MyCustomerList> {

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<CustomerProvider>(context);
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Row(
                children: [
                  FilterChip(
                    label: Text("Pembelian"),
                    selected: prov.getCountOrder,
                    onSelected: (value) {
                      prov.setCountOrder = value;
                    },
                  ),
                  FilterChip(
                    label: Text("5 Teratas"),
                    selected: prov.getTopBuy,
                    onSelected: (value) {
                      prov.setTopBuy = value;
                    },
                  ),
                ],
              ),
              
              if (prov.getTopBuy)
                for (var i = 0; i < prov.getTopBuyers().length; i++)
                  ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.person),
                      backgroundColor: Color(0xffFD61876E),
                    ),
                    title: Text("${prov.customers[i]['name']}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Jumlah pembelian : ${prov.customers[i]['order']}'),
                        Text('Telepon : ${prov.customers[i]['hp']}'),
                        Divider(
                          color: Colors.grey,
                          thickness: 0.1,
                        ),
                      ],
                    ),
                  ),
              if (prov.getCountOrder)
                for (var i = 0; i < prov.getFrequentShoppers().length; i++)
                  ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.person),
                      backgroundColor: Color(0xffFD61876E),
                    ),
                    title: Text("${prov.customers[i]['name']}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Jumlah pembelian : ${prov.customers[i]['order']}'),
                        Text('Telepon : ${prov.customers[i]['hp']}'),
                        Divider(
                          color: Colors.grey,
                          thickness: 0.1,
                        ),
                      ],
                    ),
                  ),
              for (var i = 0; i < prov.customers.length; i++)
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.person),
                    backgroundColor: Color(0xffFD61876E),
                  ),
                  title: Text("${prov.customers[i]['name']}"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Jumlah pembelian : ${prov.customers[i]['order']}'),
                      Text('Telepon : ${prov.customers[i]['hp']}'),
                      Divider(
                        color: Colors.grey,
                        thickness: 0.1,
                      ),
                    ],
                  ),
                ),
            ],
          )),
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
                    title: Text('Tambah pelanggan', style: GoogleFonts.inter()),
                    centerTitle: false,
                    automaticallyImplyLeading: false,
                    leading: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          prov.addCustomer(
                              prov.getNameController.text,
                              int.parse(prov.getOrderController.text),
                              prov.getPhoneController.text);
                          Navigator.of(context).pop();
                        },
                        child: Text('Tambah',
                            style: GoogleFonts.inter(color: Colors.white)),
                      ),
                    ],
                  ),
                  body: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                            controller: prov.nameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      const BorderSide(color: Colors.black)),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              fillColor: Colors.black,
                              hintText: "Nama Pelanggan",
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                            controller: prov.orderController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      const BorderSide(color: Colors.black)),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              fillColor: Colors.black,
                              hintText: "Jumlah Pesanan",
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                            controller: prov.phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      const BorderSide(color: Colors.black)),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              fillColor: Colors.black,
                              hintText: "Telepon",
                            )),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
