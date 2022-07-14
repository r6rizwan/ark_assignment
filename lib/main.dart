import 'package:ark_assignment/Screens/navbar.dart';
import 'package:ark_assignment/Theme/theme_notifier.dart';
import 'package:ark_assignment/Theme/theme_values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(blueTheme), child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ark Newtech',
      theme: themeNotifier.getTheme(),
      home: const NavBarWidget(),
    );
  }
}
