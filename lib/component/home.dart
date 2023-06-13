import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobile/Provider/homeProvider.dart';
import 'package:provider/provider.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyHomeProvider>(context);
    var tmp = prov.jsonData['data'];
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  CarouselSlider(
                    items: prov.carouselItem.map((item) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 3.0),
                            child: Image.asset(
                              item['image'],
                              fit: BoxFit.fill,
                            ),
                          );
                        },
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 300.0,
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          prov.setIndex = index;
                        });
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 10.0,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Text(
                          prov.carouselItem[prov.getIndex]['caption'],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: prov.carouselItem.map((item) {
                  int index = prov.carouselItem.indexOf(item);
                  return Container(
                    width: 10.0,
                    height: 10.0,
                    margin: EdgeInsets.symmetric(horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: prov.getIndex == index ? Color(0xffFD61876E) : Colors.grey,
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Produk Terlaris',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tmp.length,
                itemBuilder: (context, index) => Card(
                  child: Container(
                    child: Column(
                      children: [
                        Image.asset(
                          tmp[index]['image'],
                          width: 150,
                          fit: BoxFit.fitHeight,
                          height: 200,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text('${tmp[index]['name']}'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 7),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pelanggan Favorit',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
