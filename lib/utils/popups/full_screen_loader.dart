import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wayfinder/utils/constant/colors.dart';
import 'package:wayfinder/utils/helpers/helper_functions.dart';
import '../../common/widgets/animation_loader.dart';

class TFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) =>
          PopScope(
              canPop: false,
              child: Container(
                color: THelperFunctions.isDarkMode(Get.context!) ? TColors.dark: TColors.white,
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(height: 250),
                    TAnimationLoaderWidget(text: text, animation: animation),
                  ],
                ),
              ),
          ),
    );
  }

  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}