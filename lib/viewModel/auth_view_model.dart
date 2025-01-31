import 'package:comments/models/sign_in_model.dart';
import 'package:comments/models/sign_up_model.dart';
import 'package:comments/models/signing_response_model.dart';
import 'package:comments/services/firebase_service.dart';
import 'package:comments/utils/app_toast.dart';
import 'package:flutter/material.dart';

class AuthViewModel with ChangeNotifier {
  final FirebaseService _firebaseService = FirebaseService();
  bool isLoading = false;

  Future<bool> signUp(SignUpModel signupModel) async {
    ///Show loading indicator
    isLoading = true;
    notifyListeners();

    ///Sign up the user
    SigningResponseModel? response = await _firebaseService.signUp(signupModel);
    if (response.userCredential != null) {
      AppToast.show('Sign up successful');

      ///Hide loading indicator
      isLoading = false;
      notifyListeners();
      return true;
    } else {
      AppToast.show(response.error!);
    }

    ///Hide loading indicator
    isLoading = false;
    notifyListeners();
    return false;
  }

  Future<bool> signIn(SignInModel signupModel) async {
    ///Show loading indicator
    isLoading = true;
    notifyListeners();

    ///Sign in the user
    SigningResponseModel? response = await _firebaseService.signIn(signupModel);
    if (response.userCredential != null) {
      AppToast.show('Sign up successful');

      ///Hide loading indicator
      isLoading = false;
      notifyListeners();
      return true;
    } else {
      AppToast.show(response.error!);
    }

    isLoading = false; 
    notifyListeners();
    return false;
  }

  int addNumbers(int a, int b){
    return a+b;
  }
}
