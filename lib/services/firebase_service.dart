import 'package:comments/models/sign_in_model.dart';
import 'package:comments/models/sign_up_model.dart';
import 'package:comments/models/signing_response_model.dart';
import 'package:comments/utils/app_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FirebaseService {
  FirebaseService._();
  static final FirebaseService _instance = FirebaseService._();
  factory FirebaseService() => _instance;

  Future<void> initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  ///Sign up a user
  Future<SigningResponseModel> signUp(SignUpModel user) async {
    SigningResponseModel response;
    try {
      final UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      await credential.user?.updateDisplayName(user.name);
      AppToast.show('Sign up successful');
      response = SigningResponseModel(
        userCredential: credential,
        error: null,
      );
      return response;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        response = SigningResponseModel(
          userCredential: null,
          error: 'The password provided is too weak.',
        );
      } else if (e.code == 'email-already-in-use') {
        response = SigningResponseModel(
          userCredential: null,
          error: 'The account already exists for that email.',
        );
      } else {
        response = SigningResponseModel(
          userCredential: null,
          error: 'Something went wrong',
        );
      }
      return response;
    } on Exception catch (_) {
      response = SigningResponseModel(
        userCredential: null,
        error: 'Something went wrong',
      );
      return response;
    }
  }

  ///Sign in a user
  Future<SigningResponseModel> signIn(SignInModel user) async {
    SigningResponseModel response;
    try {
      final UserCredential credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      response = SigningResponseModel(
        userCredential: credential,
        error: null,
      );
      return response;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        response = SigningResponseModel(
          userCredential: null,
          error: 'No user found for that email.',
        );
      } else if (e.code == 'wrong-password') {
        response = SigningResponseModel(
          userCredential: null,
          error: 'Wrong password',
        );
      } else if (e.code == 'invalid-credential') {
        response = SigningResponseModel(
          userCredential: null,
          error: 'Invalid credential',
        );
      } else {
        response = SigningResponseModel(
          userCredential: null,
          error: 'Something went wrong',
        );
      }
      return response;
    } catch (e) {
      response = SigningResponseModel(
        userCredential: null,
        error: 'Something went wrong',
      );
      return response;
    }
  }
}
