import 'package:dunzo/pages/home.dart';
import 'package:dunzo/pages/order.dart';
import 'package:dunzo/pages/profile.dart';
import 'package:dunzo/pages/wallet.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {

  int currentTabIndex = 0;

  late List<Widget> pages;
  late Widget currentPage;
  late Home homepage;
  late Profile profile;
  late Order order;
  late Wallet wallet;

  @override
  void initState() {
    homepage=const Home();
    profile=const Profile();
    order=const Order();
    wallet=const Wallet();
    pages=[homepage, order, wallet, profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}