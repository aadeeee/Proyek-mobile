import 'package:flutter/material.dart';
import 'package:mobile/Provider/pelangganProvider.dart';

import 'package:provider/provider.dart';

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
              TextField(
                controller: prov.getNameController,
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Cari...',
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
                        label: Text("Pembelian"),
                        selected: prov.getCountOrder,
                        onSelected: (value) {
                          prov.setCountOrder = value;
                          prov.setTopBuy = false;
                        },
                      ),
                    ),
                    FilterChip(
                      label: Text("5 Teratas"),
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
              if (!(prov.getCountOrder) && !(prov.getTopBuy))
              for (var i = 0; i < prov.searchCustomers(searchText).length; i++)
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.person),
                    backgroundColor: Color(0xffFD61876E),
                  ),
                  title: Text("${prov.searchCustomers(searchText)[i]['name']}"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jumlah pembelian : ${prov.searchCustomers(searchText)[i]['order']}',
                      ),
                      Text(
                          'Telepon : ${prov.searchCustomers(searchText)[i]['hp']}'),
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
                    title: Text('Tambah pelanggan',
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
                          child: Text(
                            'Tambah',
                            style: TextStyle(fontSize: 20),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffFD61876E),
                              minimumSize: const Size.fromHeight(60),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                      )
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
