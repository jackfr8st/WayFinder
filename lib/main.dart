import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wayfinder/utils/theme/theme.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'data/repositories/auth_repo.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // Add Widget bindings
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Init local storage
  await GetStorage.init();

  // To do: await native splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // To do: initialize firebase
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
        (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  // To do: initialize auth

  runApp(const App());
}
