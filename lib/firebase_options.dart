// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCi1OVrbj1BAdFrACQLWJLmWiGkPG2NKb8',
    appId: '1:446871856496:web:1250b8fc8a466ef7cb1bb5',
    messagingSenderId: '446871856496',
    projectId: 'comments-c1397',
    authDomain: 'comments-c1397.firebaseapp.com',
    storageBucket: 'comments-c1397.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB0wlGxIRMyoOq61MO46q4UjxdncWJydrA',
    appId: '1:446871856496:android:1080c6cf15b57c93cb1bb5',
    messagingSenderId: '446871856496',
    projectId: 'comments-c1397',
    storageBucket: 'comments-c1397.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDOnQeV_sY4vC64Ea8Rhl3KxMUafw4y7lU',
    appId: '1:446871856496:ios:f4db21faa59d7184cb1bb5',
    messagingSenderId: '446871856496',
    projectId: 'comments-c1397',
    storageBucket: 'comments-c1397.appspot.com',
    iosBundleId: 'com.example.comments',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDOnQeV_sY4vC64Ea8Rhl3KxMUafw4y7lU',
    appId: '1:446871856496:ios:f4db21faa59d7184cb1bb5',
    messagingSenderId: '446871856496',
    projectId: 'comments-c1397',
    storageBucket: 'comments-c1397.appspot.com',
    iosBundleId: 'com.example.comments',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCi1OVrbj1BAdFrACQLWJLmWiGkPG2NKb8',
    appId: '1:446871856496:web:dbb837c4be7cdbdacb1bb5',
    messagingSenderId: '446871856496',
    projectId: 'comments-c1397',
    authDomain: 'comments-c1397.firebaseapp.com',
    storageBucket: 'comments-c1397.appspot.com',
  );
}
