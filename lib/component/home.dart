import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/Provider/homeProvider.dart';
import 'package:provider/provider.dart';
import '../Variabel/global.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> with TickerProviderStateMixin {
  late AnimationController _hourAnimationController;
  late AnimationController _minuteAnimationController;
  late AnimationController _secondAnimationController;
  late Animation<double> _hourAnimation;
  late Animation<double> _minuteAnimation;
  late Animation<double> _secondAnimation;
  late DateTime _currentDateTime;
  bool _disposed = false;

  @override
  void initState() {
    super.initState();
    _hourAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(hours: 12),
    )..repeat();
    _minuteAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(minutes: 60),
    )..repeat();
    _secondAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    )..repeat();

    _hourAnimation =
        Tween<double>(begin: 0, end: 1).animate(_hourAnimationController);
    _minuteAnimation =
        Tween<double>(begin: 0, end: 1).animate(_minuteAnimationController);
    _secondAnimation =
        Tween<double>(begin: 0, end: 1).animate(_secondAnimationController);

    _currentDateTime = DateTime.now();
    _startDateTimeUpdate();
  }

  @override
  void dispose() {
    _disposed = true;
    _hourAnimationController.dispose();
    _minuteAnimationController.dispose();
    _secondAnimationController.dispose();
    super.dispose();
  }

  void _startDateTimeUpdate() async {
    while (!_disposed) {
      await Future.delayed(const Duration(seconds: 1));
      if (!_disposed) {
        setState(() {
          _currentDateTime = DateTime.now();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final hourString = DateFormat('HH').format(_currentDateTime);
    final minuteString = DateFormat('mm').format(_currentDateTime);
    final secondString = DateFormat('ss').format(_currentDateTime);
    var prov = Provider.of<MyHomeProvider>(context);

    var tmp = prov.jsonData['data'];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      color:
                          prov.getIndex == index ? primaryColor : Colors.grey,
                    ),
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: AnimatedBuilder(
                  animation: _hourAnimationController,
                  builder: (context, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.scale(
                          scale: 1.0 + _hourAnimation.value * 0.1,
                          child: Text(
                            hourString,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          ":",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Transform.scale(
                          scale: 1.0 + _minuteAnimation.value * 0.1,
                          child: Text(
                            minuteString,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          ":",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Transform.scale(
                          scale: 1.0 + _secondAnimation.value * 0.1,
                          child: Text(
                            secondString,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 20),
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
                      padding: EdgeInsets.only(left: 10),
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
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 20),
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
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(Icons.people_outline),
                    ),
                  ],
                ),
              ),
              const ListTile(
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
              const ListTile(
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
