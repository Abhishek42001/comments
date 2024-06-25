import 'package:firebase_auth/firebase_auth.dart';

class SigningResponseModel {
  final UserCredential? userCredential;
  final String? error;

  SigningResponseModel({
     this.userCredential,
     this.error,
  });
}
