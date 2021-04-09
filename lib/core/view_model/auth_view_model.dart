import 'package:e_commerce_app/core/services/firestore_user.dart';
import 'package:e_commerce_app/helper/local_storage_data.dart';
import 'package:e_commerce_app/model/user_model.dart';
import 'package:e_commerce_app/view/control_view.dart';
import 'package:e_commerce_app/view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController{
  GoogleSignIn _googleSignIn= GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin= FacebookLogin();

  String email;
  String password;
  String name;
  Rx<User> _user = Rx<User>();
  String get user=> _user.value?.email;
  final LocalStorageData localStorageData = Get.find();
 @override
  void onInit() {
   _user.bindStream(_auth.authStateChanges());
   if(_auth.currentUser != null)
     getCurrentUserData(_auth.currentUser.uid);
super.onInit();
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
void googleSignInMethod() async{
  final GoogleSignInAccount googleUser= await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth= await googleUser.authentication;

  final GoogleAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
     await _auth.signInWithCredential(credential).then((user) async {
       saveUser(user);
       await FireStoreUser().getCurrentUser(user.user.uid)
           .then((value) {
         setUser(UserModel.fromJson(value.data()));
       });
       Get.offAll(HomeView());

     });
}


void facebookSignInMethod() async{
   FacebookLoginResult result = await _facebookLogin.logIn(['email']);

   final accessToken = result.accessToken.token;

   if (result.status == FacebookLoginStatus.loggedIn) {
     final faceCredential = FacebookAuthProvider.credential(accessToken);

     await _auth.signInWithCredential(faceCredential).then((user) async {
       saveUser(user);
       await FireStoreUser().getCurrentUser(user.user.uid)
           .then((value) {
         setUser(UserModel.fromJson(value.data()));
       });
       Get.offAll(ControlView());
     });
   }


}

void signInWithEmailAndPassword () async {
   try{
     await _auth.signInWithEmailAndPassword(email: email, password: password)
         .then((value)async{
          getCurrentUserData(value.user.uid);
           });
     Get.offAll(ControlView());
   }catch(e){
     print(e.message);
     Get.snackbar("Login error", e.message, colorText:Colors.red,
     snackPosition: SnackPosition.BOTTOM);
   }
}
  void createAccountWithEmailAndPassword () async {
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((user) async{
        saveUser(user);

      });
      Get.offAll(HomeView());
    }catch(e){
      print(e.message);
      Get.snackbar("Login error", e.message, colorText:Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void saveUser (UserCredential user) async {
    UserModel userModel= UserModel(
      userId: user.user.uid,
      email: user.user.email,
      name: name == null ? user.user.displayName : name,
      pic: '',
    );
    await FireStoreUser().addUserToFireStore(userModel);
  }

void setUser (UserModel userModel) async {
   await localStorageData.setUser(userModel);
}
void getCurrentUserData(String uid)async{
   await FireStoreUser().getCurrentUser(uid).then((value) {

     setUser(UserModel.fromJson(value.data()));
   });
}

}
