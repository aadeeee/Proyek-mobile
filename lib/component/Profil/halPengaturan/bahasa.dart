import 'package:flutter/material.dart';

class MyBahasa extends StatelessWidget {
  const MyBahasa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFD61876E),
        leading: BackButton(
          onPressed: () => Navigator.pop(context, false),
          // Icons.arrow_back,
          color: Colors.white,
        ),
        title: Text(
          "Bahasa Aplikasi",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontFamily: 'Inter',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  child: Image.asset(
                'assets/images/bahasa.png',
                height: 300,
              )),
              Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey))),
                child: ListTile(
                  title: Text('English'),
                  subtitle: Text('Bahasa Inggris'),
                  onTap: () {},
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey))),
                child: ListTile(
                  title: Text('Bahasa Indonesia'),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
