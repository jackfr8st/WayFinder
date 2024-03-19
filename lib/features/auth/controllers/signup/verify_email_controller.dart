import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:wayfinder/common/widgets/loaders.dart';
import 'package:wayfinder/data/repositories/auth_repo.dart';
import 'package:wayfinder/features/auth/screens/signup/success_screen.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  ///send email whenever verify screen appears and set timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  ///send email verificatiion link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(title: "Email Sent",
          message: "Please check your inbox and verify your email.");
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  ///timer to automatically redirect on email verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false){
        timer.cancel();
        Get.off(() => SuccessScreen(
          image: "assets/images/email_verification/sammy-line-success.png",
          title: "Your account was successfully created !",
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
        );
      }
    });
  }

///manually check if email verified
checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified){
      Get.off(() => SuccessScreen(
        image: "assets/images/email_verification/sammy-line-success.png",
        title: "Your account was successfully created !",
        onPressed: () => AuthenticationRepository.instance.screenRedirect(),
      ),
      );
    }
}

}
