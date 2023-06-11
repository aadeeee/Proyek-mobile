
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _carouselItems = [
    {
      'image': 'assets/images/toko1.png',
      'caption': 'Beautiful Landscape',
    },
    {
      'image': 'assets/images/toko1.png',
      'caption': 'Beautiful store',
    },
    {
      'image': 'assets/images/toko1.png',
      'caption': 'Beautiful Landscape',
    },
    {
      'image': 'assets/images/toko1.png',
      'caption': 'Beautiful Landscape',
    },
    {
      'image': 'assets/images/toko1.png',
      'caption': 'Beautiful Landscape',
    },
    
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Stack(
              children: [
                CarouselSlider(
                  items: _carouselItems.map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Image.asset(
                            item['image'],
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 250.0,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
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
                        _carouselItems[_currentIndex]['caption'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _carouselItems.map((item) {
                int index = _carouselItems.indexOf(item);
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index ? Colors.blue : Colors.grey,
                  ),
                );
              }).toList(),
            ),
            
          ],
        ),
        
      ],
    );
  }
}
