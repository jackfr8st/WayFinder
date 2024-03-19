import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:wayfinder/common/styles/spacing_styles.dart';
import 'package:wayfinder/features/auth/screens/login/login.dart';

import '../../../../utils/constant/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.onPressed});

  final String image, title;
  final VoidCallback onPressed;

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
                  image: AssetImage(image),
                  width: THelperFunctions.screenWidth() * 0.8),
              const SizedBox(height: 50),

              //title & subtitle
              Text(title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: 40),

              //button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    child: const Text("Continue"),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
