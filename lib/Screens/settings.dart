//This is the settings screen which contains the option to change the theme of the app.
//It consists of 4 pre-defined themes to choose from.

import 'package:ark_assignment/Theme/theme_notifier.dart';
import 'package:ark_assignment/Theme/theme_values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

//Settings Screen Build Widget
class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                _openCustomDialog(context);
              },
              child: ListTile(
                leading: Icon(Icons.color_lens,
                    color: Theme.of(context).textTheme.bodyText1?.color),
                title: Text('Change Theme',
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1?.color)),
              ),
            ),
            Divider(
                thickness: 1,
                color: Theme.of(context).textTheme.bodyText1?.color)
          ],
        ),
      ),
    );
  }

  //Dialog Box to change the theme
  Future<void> _openCustomDialog(BuildContext context) {
    var textstyle =
        TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05);
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Choose a Theme'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
                Provider.of<ThemeNotifier>(context, listen: false)
                    .setTheme(blueTheme);
              },
              child: Text(
                'Blue',
                style: textstyle,
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
                Provider.of<ThemeNotifier>(context, listen: false)
                    .setTheme(darkTheme);
              },
              child: Text(
                'Dark',
                style: textstyle,
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
                Provider.of<ThemeNotifier>(context, listen: false)
                    .setTheme(greenTheme);
              },
              child: Text(
                'Green',
                style: textstyle,
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
                Provider.of<ThemeNotifier>(context, listen: false)
                    .setTheme(pinkTheme);
              },
              child: Text(
                'Pink',
                style: textstyle,
              ),
            ),
          ],
        );
      },
    );
  }
}
