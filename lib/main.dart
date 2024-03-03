import 'package:flutter/material.dart';
import 'package:wayfinder/utils/theme/theme.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,  //sets the theme according to the theme of the system
      /* this approach is messy
      theme: ThemeData(),  // Default theme -> light
      darkTheme: ThemeData(),
      */

      //instead make a separate class for the theme
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
    );
  }
}
