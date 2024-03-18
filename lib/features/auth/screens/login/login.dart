import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wayfinder/common/styles/spacing_styles.dart';
import 'package:wayfinder/features/Main/home.dart';
import 'package:wayfinder/features/auth/screens/signup/signup.dart';
import 'package:wayfinder/utils/constant/colors.dart';
import 'package:wayfinder/utils/constant/sizes.dart';
// import 'package:wayfinder/utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //since we wanna make the screen scrollable for smaller screen we use SingleChildScrollView
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              //logo, title & subtitle
              TLoginHeader(),

              //Form
              TLoginForm(),

              //divider
              TFormDivider(),
              SizedBox(height: TSizes.spaceBtwSections),

              //Footer
              TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: TColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
                width: TSizes.iconMd,
                height: TSizes.iconMd,
                image: AssetImage("assets/logos/google-icon.png")),
          ),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: TColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
                width: TSizes.iconMd,
                height: TSizes.iconMd,
                image: AssetImage("assets/logos/facebook-icon.png")),
          ),
        ),
      ],
    );
  }
}

class TFormDivider extends StatelessWidget {
  const TFormDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Flexible(
          child: Divider(
            color: TColors.darkGrey,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text("or Sign in with".capitalize!,
            style: Theme.of(context).textTheme.labelMedium),
        const Flexible(
          child: Divider(
            color: TColors.darkGrey,
            thickness: 0.5,
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            //email
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right), labelText: "Email"),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            //password
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: "Password",
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            //remember me & forget password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //remember me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text("Remember Me")
                  ],
                ),

                //forget pass
                TextButton(
                  onPressed: () {},
                  child: const Text("Forget Password?"),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            //sign in
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => const Home()), child: const Text("Sign In"))),
            const SizedBox(height: TSizes.spaceBtwItems),

            //create acc
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.to(const SignUpScreen()),
                    child: const Text("Create Account"))),
          ],
        ),
      ),
    );
  }
}

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Image(
          height: 150,
          image: AssetImage("assets/logos/wayfinder.png"),
        ),
        Text("Welcome Back!",
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: TSizes.sm),
      ],
    );
  }
}
