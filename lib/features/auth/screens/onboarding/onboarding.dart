import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wayfinder/features/auth/controllers/onboarding/onboarding_controller.dart';
import 'package:wayfinder/features/auth/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:wayfinder/features/auth/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:wayfinder/features/auth/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:wayfinder/utils/constant/colors.dart';
import 'package:wayfinder/utils/constant/sizes.dart';
import 'package:wayfinder/utils/devices/device_utility.dart';
import 'package:wayfinder/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context){
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          ///horizontal scrollable pages
          //to create swipable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: "assets/images/onboarding_images/onboarding.gif",
                title: "Get Anywhere!!",
                subTitle: "Find the place you wanna get to at the click of a button",
              ),
              OnBoardingPage(
                image: "assets/images/onboarding_images/onboarding2.gif",
                title: "Real-time Location!!",
                subTitle: "You are positioned in real-time",
              ),
            ],
          ),

          ///skip button
          const OnBoardingSkip(),
          
          ///dot navigation smoothPageIndicator
          const OnBoardingDotNavigation(),

          /// Circular button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}


class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key, required this.image, required this.title, required this.subTitle,
  });

  final String image, title , subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: THelperFunctions.screenWidth() * 0.85,
            height: THelperFunctions.screenHeight() * 0.7,
            image: AssetImage(image),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: TSizes.spaceBtwItems,),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}