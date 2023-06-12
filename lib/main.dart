import 'package:flutter/material.dart';
import 'package:mobile/Provider/emailProvider.dart';
import 'package:mobile/Provider/loginProvider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/Provider/regisProvider.dart';
import 'package:mobile/component/daftar.dart';
import 'package:mobile/component/home.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp(ChangeNotifierProvider(create: (_) => MyData(), child: const MyApp()));
// }
void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => MyRegisProvider()),
      ChangeNotifierProvider(create: (_) => MyEmailProvider()),
      ChangeNotifierProvider(create: (_) => MyLoginProvider())
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventory plus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.purple,
      ),
      home: MyHome(),
    );
  }
}
