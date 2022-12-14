import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_cash/view/screens/history/history_screen.dart';
import 'package:six_cash/view/screens/home/home_screen.dart';
import 'package:six_cash/view/screens/profile/profile_screen.dart';

import '../view/screens/cards/cards_screen.dart';

class MenuController extends GetxController implements GetxService {
  int _currentTab = 0;
  int get currentTab => _currentTab;
  final List<Widget> screen = [
    HomeScreen(),
    CardScreen(),
    HistoryScreen(),
    ProfileScreen()
  ];
  Widget _currentScreen = HomeScreen();
  Widget get currentScreen => _currentScreen;

  resetNavBar() {
    _currentScreen = HomeScreen();
    _currentTab = 0;
  }

  selectHomePage() {
    _currentScreen = HomeScreen();
    _currentTab = 0;
    update();
  }

  selectCardPage() {
    _currentScreen = CardScreen();
    _currentTab = 1;
    update();
  }

  selectHistoryPage() {
    _currentScreen = HistoryScreen();
    _currentTab = 2;
    update();
  }

  selectProfilePage() {
    _currentScreen = ProfileScreen();
    _currentTab = 3;
    update();
  }
}
