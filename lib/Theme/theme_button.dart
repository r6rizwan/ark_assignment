import 'package:ark_assignment/Theme/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeButton extends StatelessWidget {
  final ThemeData buttonThemeData;

  const ThemeButton({Key? key, required this.buttonThemeData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return RawMaterialButton(
      onPressed: () {
        themeNotifier.setTheme(buttonThemeData);
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (Widget child, Animation<double> animation) =>
            ScaleTransition(
          child: child,
          scale: animation,
        ),
        child: _getIcon(themeNotifier),
      ),
      shape: const CircleBorder(),
      elevation: 2.0,
      fillColor: buttonThemeData.primaryColor,
      padding: const EdgeInsets.all(15.0),
    );
  }

  Widget _getIcon(ThemeNotifier themeNotifier) {
    bool selected = (themeNotifier.getTheme() == buttonThemeData);

    return Container(
      key: Key((selected) ? "ON" : "OFF"),
      child: Icon(
        (selected) ? Icons.done : Icons.close,
        color: buttonThemeData.colorScheme.secondary,
        size: 20.0,
      ),
    );
  }
}
