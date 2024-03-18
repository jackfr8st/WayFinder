import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();


  //variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs; // obs => changes the design w/o using stateful widget

  //update current index when page scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  //jump to specific dot selected page
  void dotNavigationClick(index){
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  //update current index & jump to next page
  void nextPage(){
    if(currentPageIndex.value == 1){
      final storage = GetStorage();
      storage.write("isFirstTime", false);
      Get.offAll( const LoginScreen());  //takes you to the login screen
    }else{
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  // update current index & jump to last page
  void skipPage(){
    currentPageIndex.value = 1;
    pageController.jumpTo(1);
  }

}

