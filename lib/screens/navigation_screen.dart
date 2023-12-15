import 'package:design_challenge_1/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cart_screen.dart';
import 'favourite_screen.dart';
import 'home_screen.dart';

class BotNavigationScreen extends StatefulWidget {
  const BotNavigationScreen({super.key});

  @override
  State<BotNavigationScreen> createState() => _BotNavigationScreenState();
}

class _BotNavigationScreenState extends State<BotNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _bodyList = [
    const HomeScreen(),
    const CartScreen(),
    const FavouriteScreen(),
    const ProfileScreen(),
  ];

  final List<BottomNavigationBarItem> navItemList = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.shopping_basket),
      label: "",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.favorite_outlined),
      label: "",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: navItemList),
    );
  }
}
