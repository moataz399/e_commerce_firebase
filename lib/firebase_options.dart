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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBYBFRawF6IGqpQWmdHo7YJYsOXLnxcCTI',
    appId: '1:942826855435:web:17606bd84a0a628e997b0e',
    messagingSenderId: '942826855435',
    projectId: 'e-commerce-2643a',
    authDomain: 'e-commerce-2643a.firebaseapp.com',
    storageBucket: 'e-commerce-2643a.appspot.com',
    measurementId: 'G-VBXYD5G97C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC4RdJ82Lf-pyb3UVH12b826D6XJb4CouM',
    appId: '1:942826855435:android:378c36a6c021c750997b0e',
    messagingSenderId: '942826855435',
    projectId: 'e-commerce-2643a',
    storageBucket: 'e-commerce-2643a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA57Fwu-LrQVRRp3DpTKcJrRajikCy25e8',
    appId: '1:942826855435:ios:dc231124eb8dd0db997b0e',
    messagingSenderId: '942826855435',
    projectId: 'e-commerce-2643a',
    storageBucket: 'e-commerce-2643a.appspot.com',
    iosBundleId: 'com.example.eCommerceFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA57Fwu-LrQVRRp3DpTKcJrRajikCy25e8',
    appId: '1:942826855435:ios:6c7f5a2c9ead2f08997b0e',
    messagingSenderId: '942826855435',
    projectId: 'e-commerce-2643a',
    storageBucket: 'e-commerce-2643a.appspot.com',
    iosBundleId: 'com.example.eCommerceFirebase.RunnerTests',
  );
}
