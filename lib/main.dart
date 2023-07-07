import 'package:flutter/material.dart';
import 'package:mobile/Provider/emailProvider.dart';
import 'package:mobile/Provider/pelangganProvider.dart';
import 'package:mobile/Provider/produkprovider.dart';
import 'package:mobile/Provider/profilProvider.dart';
import 'package:mobile/Provider/regisProvider.dart';
import 'package:mobile/Provider/supplierProvider.dart';
import 'package:mobile/Provider/transaksiProvider.dart';
import 'package:mobile/component/Produk/produkSupply.dart';
import 'package:mobile/component/app.dart';
import 'package:provider/provider.dart';
import 'Provider/homeProvider.dart';
import 'package:mobile/component/Account/login.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => MyRegisProvider()),
      ChangeNotifierProvider(create: (_) => MyEmailProvider()),
      ChangeNotifierProvider(create: (_) => MyHomeProvider()),
      ChangeNotifierProvider(create: (_) => ProfilProvider()),
      ChangeNotifierProvider(create: (_) => CustomerProvider()),
      ChangeNotifierProvider(create: (_) => TransactionProvider()),
      ChangeNotifierProvider(create: (_) => MySupplierProvider()),
      ChangeNotifierProvider(create: (_) => MyProductProvider()),
    ], child:  const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<ProfilProvider>(context);
    return MaterialApp(
      title: 'Inventory plus',
      debugShowCheckedModeBanner: false,
      theme: prov.getTheme(),
      home: MyMain(),
    );
  }
}
