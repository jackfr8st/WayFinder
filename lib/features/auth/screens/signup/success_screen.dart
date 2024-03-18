import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:wayfinder/common/styles/spacing_styles.dart';
import 'package:wayfinder/features/auth/screens/login/login.dart';

import '../../../../utils/constant/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              const SizedBox(height: 50),

              //image
              Image(
                  image: const AssetImage(
                      "assets/images/email_verification/sammy-line-success.png"),
                  width: THelperFunctions.screenWidth() * 0.8),
              const SizedBox(height: 50),

              //title & subtitle
              Text("Your account was successfully created !",
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: 40),

              //button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => const LoginScreen()),
                    child: const Text("Continue"),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
