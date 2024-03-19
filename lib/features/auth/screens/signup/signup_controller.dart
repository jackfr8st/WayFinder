import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wayfinder/common/widgets/loaders.dart';
import 'package:wayfinder/data/repositories/auth_repo.dart';
import 'package:wayfinder/data/user/user_repo.dart';
import 'package:wayfinder/features/auth/screens/login/login.dart';
import 'package:wayfinder/features/auth/screens/onboarding/onboarding.dart';
import 'package:wayfinder/features/auth/screens/signup/verify_email.dart';
import 'package:wayfinder/utils/popups/full_screen_loader.dart';

import '../../../../common/widgets/network_manager.dart';
import '../../../../common/widgets/user_model.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  ///variables
  final hidePassword = true.obs;
  final email = TextEditingController();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final phone = TextEditingController();
  GlobalKey<FormState> signupFormKey =
  GlobalKey<FormState>(); //form key for form validation

  ///called from main.dart on app launch
  Future<void> signup() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog(
          "We are processing your information...",
          "assets/images/email_verification/sammy-line-workout.gif");

      //check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      ///Form validation
      if (!signupFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      ///Register user in Firebase Auth & save user data in firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      ///save authenticated user data in the firebase firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstname: firstname.text.trim(),
          lastname: lastname.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phone: phone.text.trim());

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      TFullScreenLoader.stopLoading();

      ///show success message
      TLoaders.successSnackBar(title: "Congratulations!", message: "Your account has been created!Verify email to continue.");
      
      ///move to the verify screen
      Get.to(() =>  VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      //remove loader
      TFullScreenLoader.stopLoading();

      //show some generic error
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
    // } finally {
    //   TFullScreenLoader.stopLoading();
    // }
  }
}
