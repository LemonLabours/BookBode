import 'package:bookbode/app/Core/utilities/constants/colors.dart';
import 'package:bookbode/app/Views/Home/home_view.dart';
import 'package:bookbode/app/Views/Notifiy/notifiy_view.dart';
import 'package:bookbode/app/Views/Profile/profile_view.dart';
import 'package:flutter/material.dart';

import '../../../Views/Orders/order_view.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({super.key});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  List pages = [
    const HomeView(),
    const OrderView(),
    const NotificationView(),
    const ProfileView(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: hWhiteColor,
          onTap: onTap,
          currentIndex: currentIndex,
          selectedItemColor: primary,
          unselectedItemColor: hLightGray,
          showUnselectedLabels: true,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.view_carousel_outlined), label: "Orders"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_outlined),
                label: "Notification"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined), label: "Profile"),
          ]),
    );
  }
}
