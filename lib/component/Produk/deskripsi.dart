import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/produkprovider.dart';

class MyDescription extends StatefulWidget {
  final data;
  const MyDescription({super.key, required this.data});

  @override
  State<MyDescription> createState() => _MyDescriptionState();
}

class _MyDescriptionState extends State<MyDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Deskripsi'),
          backgroundColor: Color(0xffFD61876E),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "${widget.data['price']}",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Image.network(
                widget.data['imageUrl'],
                height: 200.0,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16.0),
              Text(
                'Harga: ${widget.data['price']}',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Description:${widget.data['description']}',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                widget.data['name'],
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ));
  }
}
