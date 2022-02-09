import 'package:e_shop/config/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  bool isPasswordVisible = false;

  RxString userDisplayName = ''.obs;
  RxString userDisplayPicture = ''.obs;
  RxString userDisplayEmail = ''.obs;
  final googleSign = GoogleSignIn();
  FirebaseAuth auth = FirebaseAuth.instance;

  User? get userProfile => auth.currentUser;

  final GetStorage authBox = GetStorage();
  bool isUserSignedIn = false;

  void passwordVisibilty() {
    isPasswordVisible = !isPasswordVisible;

    update();
  }

  void signupUsingEmailAndPassword({required String userName, required String email, required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value) => auth.currentUser!.updateDisplayName(userName));
      isUserSignedIn = true;
      authBox.write('userStatus', isUserSignedIn);
      update();
      Get.offAllNamed(RoutesNames.mainScreen);
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll('-', ' ').capitalize!;
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = e.message.toString();
      }
      errorSnackbar(title, message);
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    }
  }


  void loginUsingEmailAndPassword({required String email , required String password}) async{
    try {
     await auth.signInWithEmailAndPassword(
          email: email,
          password: password,
      ).then((value) => userDisplayName.value = auth.currentUser!.displayName!);
     isUserSignedIn = true;
     authBox.write('userStatus', isUserSignedIn);
     update();
     Get.offAllNamed(RoutesNames.mainScreen);
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      }
      errorSnackbar(title , message);
    }
  }

  void resetPassword({required String email}) async{
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();
      Get.back();
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      }
      errorSnackbar(title , message);
    }
  }

  void googleSignIn() async {
    try{
    final GoogleSignInAccount? googleUser = await googleSign.signIn();
    userDisplayName.value  = googleUser!.displayName!;
    userDisplayPicture.value = googleUser.photoUrl!;
    userDisplayPicture.value = googleUser.email;

    GoogleSignInAuthentication googleSignInAuthentication =
    await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    await auth.signInWithCredential(credential);
    isUserSignedIn = true;
    authBox.write('userStatus', isUserSignedIn);
    update();
    Get.offAllNamed(RoutesNames.mainScreen);
    }catch(error){
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    }
  }

  void userSignOut() async{
    try{
      await auth.signOut();
      await googleSign.signOut();
      userDisplayName.value = '';
      userDisplayPicture.value = '';
      userDisplayEmail.value = '';
      authBox.remove('userStatus');
      update();
      Get.offAllNamed(RoutesNames.loginScreen);
    }catch(error){
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    }
  }

  void errorSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }
}


