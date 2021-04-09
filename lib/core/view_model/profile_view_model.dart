import 'package:e_commerce_app/helper/local_storage_data.dart';
import 'package:e_commerce_app/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController {
  final LocalStorageData localStorageData = Get.find();

  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading =ValueNotifier(false);

  UserModel get userModel => _userModel;
  UserModel _userModel;

  @override
  void onInit() {
    getCurrentUser();

    super.onInit();
  }

  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }

  void getCurrentUser() async {
    _loading.value=true;
    await localStorageData.getUser.then((value) {
      _userModel = value;
    });
    loading.value= false;
    update();
  }
}
