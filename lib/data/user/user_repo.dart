import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wayfinder/common/widgets/user_model.dart';
import 'package:wayfinder/features/auth/screens/login/login.dart';
import 'package:wayfinder/features/auth/screens/onboarding/onboarding.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  ///variables
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  ///function to save user data to firestore
  // Future<void> saveUserRecord(UserModel user) async {
  //   try {
  //     await _db.collection("Users").doc(user.id).set(user.toJson());
  //   } on FirebaseException catch (e) {
  //     throw TFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const TFormatException();
  //   } on PlatformException catch (e) {
  //     throw TPlatformException(e.code).message;
  //   } catch (e) {
  //     throw "Something went wrong. Please try again!";
  //   }
  // }

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    }  catch (e) {
      throw "Something went wrong. Please try again!";
    }
  }
}
