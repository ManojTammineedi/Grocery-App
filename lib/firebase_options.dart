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
    apiKey: 'AIzaSyD5KC7GHZ7dGRcsB0LLORWpIsExaPUjXyU',
    appId: '1:629942846482:web:8fda5160035258d34a84cb',
    messagingSenderId: '629942846482',
    projectId: 'groceryapp-6ef94',
    authDomain: 'groceryapp-6ef94.firebaseapp.com',
    storageBucket: 'groceryapp-6ef94.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBEWu4zqvWasANQvKDUnbVPB8MJ1T6oFno',
    appId: '1:629942846482:android:df4acb3ecf3d2f884a84cb',
    messagingSenderId: '629942846482',
    projectId: 'groceryapp-6ef94',
    storageBucket: 'groceryapp-6ef94.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDiJhin_mmhDB59tgwXUqdIXeHYaxzYmvo',
    appId: '1:629942846482:ios:d888a10c2405515d4a84cb',
    messagingSenderId: '629942846482',
    projectId: 'groceryapp-6ef94',
    storageBucket: 'groceryapp-6ef94.appspot.com',
    iosBundleId: 'com.example.groceryApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDiJhin_mmhDB59tgwXUqdIXeHYaxzYmvo',
    appId: '1:629942846482:ios:d888a10c2405515d4a84cb',
    messagingSenderId: '629942846482',
    projectId: 'groceryapp-6ef94',
    storageBucket: 'groceryapp-6ef94.appspot.com',
    iosBundleId: 'com.example.groceryApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD5KC7GHZ7dGRcsB0LLORWpIsExaPUjXyU',
    appId: '1:629942846482:web:cdd1d59beb3007504a84cb',
    messagingSenderId: '629942846482',
    projectId: 'groceryapp-6ef94',
    authDomain: 'groceryapp-6ef94.firebaseapp.com',
    storageBucket: 'groceryapp-6ef94.appspot.com',
  );
}
