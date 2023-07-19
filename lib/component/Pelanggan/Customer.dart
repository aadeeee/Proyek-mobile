import 'package:flutter/material.dart';
import 'package:mobile/Provider/pelangganProvider.dart';
import 'package:mobile/component/Pelanggan/detailCustomer.dart';
import 'package:mobile/component/Pelanggan/tambahPelanggan.dart';
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
                  cursorColor: Colors.black,
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
                        label: const Row(
                          children: [
                            Text("Pembelian "),
                            Icon(
                              Icons.arrow_upward,
                              size: 20,
                            ),
                          ],
                        ),
                        selected: prov.getCountOrder,
                        onSelected: (value) {
                          prov.setCountOrder = value;
                          prov.setTopBuy = false;
                        },
                      ),
                    ),
                    FilterChip(
                      label: const Row(
                        children: [
                          Text("Pembelian"),
                          Icon(
                            Icons.arrow_downward,
                            size: 20,
                          )
                        ],
                      ),
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyDetailCustomer(
                            customer: prov.getTopBuyers()[i],
                          ),
                        ),
                      );
                    },
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyDetailCustomer(
                            customer: prov.getFrequentShoppers()[i],
                          ),
                        ),
                      );
                    },
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyDetailCustomer(
                            customer: prov.customers[i],
                          ),
                        ),
                      );
                    },
                    leading: const Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: CircleAvatar(
                        backgroundColor: primaryColor,
                        child: Icon(
                          Icons.person,
                        ),
                      ),
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
              return const AddCustomerDialog();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
