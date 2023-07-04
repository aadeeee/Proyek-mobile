import 'package:flutter/material.dart';
import 'package:mobile/Provider/pelangganProvider.dart';

import 'package:provider/provider.dart';

import '../../Variabel/global.dart';

class MyCustomerList extends StatefulWidget {
  const MyCustomerList({super.key});

  @override
  State<MyCustomerList> createState() => _MyCustomerListState();
}

class _MyCustomerListState extends State<MyCustomerList> {
  String searchText = '';
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<CustomerProvider>(context);
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                  controller: prov.getNameController,
                  onChanged: (value) {
                    setState(() {
                      searchText = value;
                    });
                  },
                  decoration: InputDecoration(
                    focusColor: primaryColor,
                    prefixIcon: const Icon(Icons.search),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: primaryColor)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: primaryColor)),
                    hintText: 'Cari',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 17,
                  right: 17,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FilterChip(
                        label: const Text("Pembelian"),
                        selected: prov.getCountOrder,
                        onSelected: (value) {
                          prov.setCountOrder = value;
                          prov.setTopBuy = false;
                        },
                      ),
                    ),
                    FilterChip(
                      label: const Text("5 Teratas"),
                      selected: prov.getTopBuy,
                      onSelected: (value) {
                        prov.setTopBuy = value;
                        prov.setCountOrder = false;
                      },
                    ),
                  ],
                ),
              ),
              if (prov.getTopBuy)
                for (var i = 0; i < prov.getTopBuyers().length; i++)
                  ListTile(
                    leading: const CircleAvatar(
                        backgroundColor: primaryColor,
                        child: Icon(Icons.person),
                      ),
                    
                    title: Text("${prov.customers[i]['name']}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Jumlah pembelian : ${prov.customers[i]['order']}'),
                        Text('Telepon : ${prov.customers[i]['hp']}'),
                        const Divider(
                          color: Colors.grey,
                          thickness: 0.1,
                        ),
                      ],
                    ),
                  ),
              if (prov.getCountOrder)
                for (var i = 0; i < prov.getFrequentShoppers().length; i++)
                  ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: primaryColor,
                      child: Icon(Icons.person),
                    ),
                    title: Text("${prov.customers[i]['name']}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Jumlah pembelian : ${prov.customers[i]['order']}'),
                        Text('Telepon : ${prov.customers[i]['hp']}'),
                        const Divider(
                          color: Colors.grey,
                          thickness: 0.1,
                        ),
                      ],
                    ),
                  ),
              if (!(prov.getCountOrder) && !(prov.getTopBuy))
                for (var i = 0;
                    i < prov.searchCustomers(searchText).length;
                    i++)
                  ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: primaryColor,
                      child: Icon(Icons.person),
                    ),
                    title:
                        Text("${prov.searchCustomers(searchText)[i]['name']}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jumlah pembelian : ${prov.searchCustomers(searchText)[i]['order']}',
                        ),
                        Text(
                            'Telepon : ${prov.searchCustomers(searchText)[i]['hp']}'),
                        const Divider(
                          color: Colors.grey,
                          thickness: 0.1,
                        ),
                      ],
                    ),
                  ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
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
                    title: const Text('Tambah pelanggan',
                        style: TextStyle(fontSize: 20)),
                    centerTitle: true,
                    automaticallyImplyLeading: false,
                    leading: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                    ),
                  ),
                  body: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                            controller: prov.nameController,
                            decoration: const InputDecoration(
                              labelText: "Nama Pelanggan",
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                            controller: prov.orderController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: "Jumlah Pesanan",
                            )),
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          controller: prov.phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            labelText: 'Telepon',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: ElevatedButton(
                          onPressed: () {
                            prov.addCustomer(
                                prov.getNameController.text,
                                int.parse(prov.getOrderController.text),
                                prov.getPhoneController.text);
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Tambah',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
