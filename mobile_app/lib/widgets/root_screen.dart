import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:orderease/constants/colors.dart';
import 'package:orderease/constants/images.dart';
import 'package:badges/badges.dart' as badges;
import 'package:orderease/screens/homeProduct/home_product_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  List<Widget> _widgetOptions() {
    return [
      const HomeProductScreen(),
      const Center(
        child: Text("Likes"),
      ),
      const Center(
        child: Text("Search"),
      ),
      const Center(
        child: Text("Profile"),
      ),
    ];
  }

  int _bottomNavIndex = 0;

  List<String> titleList = ["Home", "Likes", "Search", "Profile"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color1,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.shopping_bag, color: AppColors.color2,),
                const SizedBox(width: 10),
                Text(
                  titleList[_bottomNavIndex],
                  style: TextStyle(
                    color: AppColors.color2,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.color2,
                      borderRadius: BorderRadius.circular(12)),
                  child: IconButton(
                      onPressed: () {},
                      icon: badges.Badge(
                        badgeContent: const Text('3'),
                        badgeAnimation: const badges.BadgeAnimation.rotation(
                          animationDuration: Duration(seconds: 1),
                          colorChangeAnimationDuration: Duration(seconds: 1),
                          loopAnimation: true,
                          curve: Curves.decelerate,
                          colorChangeAnimationCurve: Curves.easeInCubic,
                        ),
                        badgeStyle: badges.BadgeStyle(
                          badgeColor: AppColors.color1,
                          elevation: 0,
                        ),
                        child: Icon(
                          Icons.shopping_basket,
                          color: AppColors.color5,
                        ),
                      )
                    ),
                )
              ],
            )
          ],
        ),
        backgroundColor: AppColors.color5,
        elevation: 3.0,
        shadowColor: AppColors.color7,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: AppColors.color1,
        color: AppColors.color5,
        items: [
          Icon(Icons.home, size: 30, color: AppColors.color2,),
          Icon(Icons.search, size: 30, color: AppColors.color2,),
          Icon(Icons.payment, size: 30, color: AppColors.color2,),
        ],
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
        animationCurve: Easing.emphasizedDecelerate,
      ),
      // bottomNavigationBar: GNav(
      //     backgroundColor: AppColors.color1,
      //     color: AppColors.color7,
      //     activeColor: AppColors.color5,
      //     tabBackgroundColor: AppColors.color2,
      //     tabBorderRadius: 12,
      //     tabMargin: const EdgeInsets.all(10),
      //     curve: Curves.decelerate,
      //     gap: 4,
      //     padding: const EdgeInsets.all(10),
      //     selectedIndex: _bottomNavIndex,
      //     onTabChange: (index) {
      //       setState(() {
      //         _bottomNavIndex = index;
      //       });
      //     },
      //     tabs: const [
      //       GButton(
      //         icon: Icons.home,
      //         text: 'Home',
      //       ),
      //       GButton(
      //         icon: Icons.heart_broken,
      //         text: 'Likes',
      //       ),
      //       GButton(
      //         icon: Icons.search,
      //         text: 'Search',
      //       ),
      //       GButton(
      //         icon: Icons.person,
      //         text: 'Profile',
      //       )
      //     ]
      // ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: _widgetOptions(),
      ),
    );
  }
}
