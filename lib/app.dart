import "package:flutter/material.dart";
import "package:get/get_navigation/get_navigation.dart";
import "package:wayfinder/bindings/general_bindings.dart";
import 'package:wayfinder/features/auth/screens/onboarding/onboarding.dart';
import "package:wayfinder/utils/constant/colors.dart";
import "package:wayfinder/utils/theme/theme.dart";

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      //show loader meanwhile the Auth Repo is deciding to show the relevant screen
      home: const Scaffold(
          backgroundColor: TColors.primary,
          body: Center(child: CircularProgressIndicator(color: Colors.white))),
    );
  }
}
