// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCumXo9FiVarAYWLmbmDo2plLLL8A14KTo',
    appId: '1:870179786007:android:9e63af1081e6dca7a1fb52',
    messagingSenderId: '870179786007',
    projectId: 'wayfinder-b13f3',
    storageBucket: 'wayfinder-b13f3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyByJ7u1eKZMhM6NWdR2O3cgxHXwXwsWps4',
    appId: '1:870179786007:ios:04a316ceaf5ec8f1a1fb52',
    messagingSenderId: '870179786007',
    projectId: 'wayfinder-b13f3',
    storageBucket: 'wayfinder-b13f3.appspot.com',
    androidClientId: '870179786007-ctk3eo0kdg3rtppq2c30dnkl4ih7fvdv.apps.googleusercontent.com',
    iosClientId: '870179786007-o512g3n9cugvmkvj1elp8qsr80f61uhv.apps.googleusercontent.com',
    iosBundleId: 'com.example.wayfinder',
  );
}
