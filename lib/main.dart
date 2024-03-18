import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wayfinder/utils/theme/theme.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // To do: Add Widget bindings
  // To do: Init local storage
  // To do: await native splash
  // To do: initialize firebase

// ...

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
        (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );
  // To do: initialize auth

  runApp(const App());
}
