import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wayfinder/data/repositories/auth_repo.dart';
import 'package:wayfinder/features/auth/controllers/signup/verify_email_controller.dart';
import 'package:wayfinder/utils/constant/sizes.dart';
import 'package:wayfinder/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          // here we didnt use get.back cause when clicked, it simply takes us back but when you click it on the
          // verfication page it should ideally direct you to the login page cause it means you have alr stored the user data
          // IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //image
              const SizedBox(height: 50),
              Image(
                  image: const AssetImage(
                      "assets/images/email_verification/sammy-line-man-receives-a-mail.png"),
                  width: THelperFunctions.screenWidth() * 0.8),
              const SizedBox(height: 50),

              //title & subtitle
              Text("Verify you email address!",
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwItems),

              //buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.checkEmailVerificationStatus(),
                    child: const Text("Continue"),
                  ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: ()  => controller.sendEmailVerification(),
                    child: const Text("Resend Email"),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
