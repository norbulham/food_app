
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_app/pages/address_page.dart';
import 'package:food_app/pages/deliver_homepage.dart';
import 'package:food_app/pages/card_page.dart';
import 'package:food_app/pages/category_pages.dart';
import 'package:food_app/pages/favorites_pages.dart';
import 'package:food_app/pages/last_page.dart';
import 'package:food_app/pages/review_page.dart';


class PracticeBottomNavBar extends StatefulWidget {
  const PracticeBottomNavBar({super.key});

  @override
  State<PracticeBottomNavBar> createState() => _PracticeBottomNavBarState();
}

class _PracticeBottomNavBarState extends State<PracticeBottomNavBar> {
  List list = [
    DeliverHomepage(),
    CardPage(),
    CategoryPages(),
    AddressPage(),
    LastPage()
  ];

  List<Icon> allItems = [
    Icon(Icons.home_outlined,color: Colors.white,),
    Icon(Icons.card_giftcard,color: Colors.white,),
    Icon(Icons.favorite_border,color: Colors.white,),
    Icon(Icons.reviews_outlined,color: Colors.white,size: 25),
    Icon(Icons.last_page,color: Colors.white,size: 30),
  ];


  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color(0xffdee2e6),
        color:Color(0xffbb3e03),

        buttonBackgroundColor:Colors.deepOrangeAccent,
        index: _currentIndex,
        onTap: (int index){
          _currentIndex = index;
          setState(() {
          });
        },
        items: allItems,
      ),
    );
  }
}



