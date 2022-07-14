//This is the navigation bar widget that will be used in the app.
//It consists of two screens: Home Screen and Settings Screen.

import 'package:ark_assignment/Theme/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:ark_assignment/Screens/home.dart';
import 'package:ark_assignment/Screens/settings.dart';
import 'package:provider/provider.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({Key? key}) : super(key: key);

  @override
  _NavBarWidgetState createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  int _selectedIndex = 0; // The index of the selected item.

  Widget callPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const HomeScreen(); // Home Screen
      case 1:
        return const SettingsScreen(); // Settings Screen
      default:
        return const HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      theme: themeNotifier.getTheme(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: const Text("Ark Newtech"),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        resizeToAvoidBottomInset: false,
        body: callPage(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor, // Unselected item color
          fixedColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor, // Selected item color
          type: BottomNavigationBarType.fixed, // Type of the navigation bar
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home', // First title of the Bottom Navigation Item.
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings', // Second title of the Bottom Navigation Item.
            ),
          ],
        ),
      ),
    );
  }
}
