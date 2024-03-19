import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../common/widgets/loaders.dart';
import '../../../../common/widgets/network_manager.dart';
import '../../../../data/repositories/auth_repo.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../screens/signup/verify_email.dart';

class LoginController extends GetxController{

  ///variables
  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();


  Future<void> emailAndPasswordSignIn() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog(
          "Logging you in .. ",
          "assets/images/email_verification/sammy-line-workout.gif");

      //check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      ///Form validation
      if (!loginFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      ///Register user in Firebase Auth & save user data in firebase
      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());


      TFullScreenLoader.stopLoading();

      ///show success message
      AuthenticationRepository.instance.screenRedirect();
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