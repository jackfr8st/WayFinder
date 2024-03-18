import 'package:flutter/material.dart';
import 'package:wayfinder/utils/constant/sizes.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Text("Hello, Ojas",
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),

            ],
          ),
        ),
      ),
    );
  }
}
