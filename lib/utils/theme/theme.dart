import 'package:flutter/material.dart';
import 'package:wayfinder/utils/theme/custom_themes/appbar_theme.dart';
import 'package:wayfinder/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:wayfinder/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:wayfinder/utils/theme/custom_themes/chip_theme.dart';
import 'package:wayfinder/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:wayfinder/utils/theme/custom_themes/text_theme.dart';

class TAppTheme {
  // to make sure the theme-constructor will not be re-used over & over add '_' sign to make it private
  TAppTheme._(); //private constructor

  // since the constructor private we use the static
  // we need to return the ThemeData based on the light/dark theme
  // now we can either create a function for the themedata or we can create a var
  /* 1. function
        static ThemeData lightTheme (){

        }*/

  // 2. var
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,  //A temporary flag that can be used to opt-out of Material 3 features. (by default: true)
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white, //treated as a separate screen in itself
    /* textTheme: TextTheme(),
      //again putting everything here would make the code messy so create a separate class for this
    */
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    chipTheme: TChipTheme.lightChipTheme,

  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    chipTheme: TChipTheme.darkChipTheme,
  );
}