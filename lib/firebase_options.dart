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
        return linux;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB0K5v82RgBwpDvXFIeAyQDJINHOTxiU3o',
    appId: '1:520697325967:web:3ff49a6e0bc8c1479383fa',
    messagingSenderId: '520697325967',
    projectId: 'ng-fitness-127f8',
    authDomain: 'ng-fitness-127f8.firebaseapp.com',
    databaseURL: 'https://ng-fitness-127f8.firebaseio.com',
    storageBucket: 'ng-fitness-127f8.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA-UAN0W05bYN71I-BsyUWckJSSXr57DEU',
    appId: '1:520697325967:android:ba1d183f6abbc8e49383fa',
    messagingSenderId: '520697325967',
    projectId: 'ng-fitness-127f8',
    databaseURL: 'https://ng-fitness-127f8.firebaseio.com',
    storageBucket: 'ng-fitness-127f8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBY6S0xjwR5qlkjTYhuei3nIFRTGj2xcPM',
    appId: '1:520697325967:ios:7b07f71230802c969383fa',
    messagingSenderId: '520697325967',
    projectId: 'ng-fitness-127f8',
    databaseURL: 'https://ng-fitness-127f8.firebaseio.com',
    storageBucket: 'ng-fitness-127f8.appspot.com',
    androidClientId: '520697325967-09niuh53t15ggq45ef2delua63cqjaqc.apps.googleusercontent.com',
    iosClientId: '520697325967-foglmhqjuh37ui9ap0fld04kan1k1val.apps.googleusercontent.com',
    iosBundleId: 'com.example.timeTracker',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBY6S0xjwR5qlkjTYhuei3nIFRTGj2xcPM',
    appId: '1:520697325967:ios:7b07f71230802c969383fa',
    messagingSenderId: '520697325967',
    projectId: 'ng-fitness-127f8',
    databaseURL: 'https://ng-fitness-127f8.firebaseio.com',
    storageBucket: 'ng-fitness-127f8.appspot.com',
    androidClientId: '520697325967-09niuh53t15ggq45ef2delua63cqjaqc.apps.googleusercontent.com',
    iosClientId: '520697325967-foglmhqjuh37ui9ap0fld04kan1k1val.apps.googleusercontent.com',
    iosBundleId: 'com.example.timeTracker',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB0K5v82RgBwpDvXFIeAyQDJINHOTxiU3o',
    appId: '1:520697325967:web:1b64a63e470a83a59383fa',
    messagingSenderId: '520697325967',
    projectId: 'ng-fitness-127f8',
    authDomain: 'ng-fitness-127f8.firebaseapp.com',
    databaseURL: 'https://ng-fitness-127f8.firebaseio.com',
    storageBucket: 'ng-fitness-127f8.appspot.com',
  );

  static const FirebaseOptions linux = FirebaseOptions(
    apiKey: 'AIzaSyB0K5v82RgBwpDvXFIeAyQDJINHOTxiU3o',
    appId: '1:520697325967:web:ad14918bb440d21b9383fa',
    messagingSenderId: '520697325967',
    projectId: 'ng-fitness-127f8',
    authDomain: 'ng-fitness-127f8.firebaseapp.com',
    databaseURL: 'https://ng-fitness-127f8.firebaseio.com',
    storageBucket: 'ng-fitness-127f8.appspot.com',
  );
}
