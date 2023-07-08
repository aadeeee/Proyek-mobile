import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobile/Provider/homeProvider.dart';
import 'package:provider/provider.dart';

import '../Variabel/global.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyHomeProvider>(context);

    var tmp = prov.jsonData['data'];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Carousel Slider
              Stack(
                children: [
                  CarouselSlider(
                    items: prov.carouselItem.map((item) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 3.0),
                            child: Image.asset(
                              item['image'],
                              width: 200,
                              height: 150,
                              fit: BoxFit.fitWidth,
                            ),
                          );
                        },
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 200.0,
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          prov.setIndex = index;
                        });
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 9.0,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Text(
                          prov.carouselItem[prov.getIndex]['caption'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Carousel Indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: prov.carouselItem.map((item) {
                  int index = prov.carouselItem.indexOf(item);
                  return Container(
                    width: 10.0,
                    height: 10.0,
                    margin: const EdgeInsets.symmetric(horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: prov.getIndex == index ? primaryColor : Colors.grey,
                    ),
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Produk Terlaris',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Icon(Icons.shopping_bag_outlined),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 190,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tmp.length,
                  itemBuilder: (context, index) => Card(
                    color: Colors.white10,
                    child: Column(
                      children: [
                        Image.asset(
                          tmp[index]['image'],
                          width: 130,
                          height: 150,
                          fit: BoxFit.fitHeight,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 9),
                          child: Text('${tmp[index]['name']}'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Pelanggan Favorit',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Icon(Icons.people_outline),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: primaryColor,
                  child: Icon(Icons.person),
                ),
                title: Text('Max'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('09242464234217'),
                  ],
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: primaryColor,
                  child: Icon(Icons.person),
                ),
                title: Text('John'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('09242464234217'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
