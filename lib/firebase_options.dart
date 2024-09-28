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
    apiKey: 'AIzaSyD-IBiyPwCmtPZkLhsx4MeFrYzy9IQUIi8',
    appId: '1:213956856275:web:a670e9adb92ff07b148726',
    messagingSenderId: '213956856275',
    projectId: 'photonest-f277f',
    authDomain: 'photonest-f277f.firebaseapp.com',
    storageBucket: 'photonest-f277f.appspot.com',
    measurementId: 'G-X98JY1VY7X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA8St130qhw8MVQApiHKiFh20rFWx_cqgA',
    appId: '1:213956856275:android:6c2f5b9993f46050148726',
    messagingSenderId: '213956856275',
    projectId: 'photonest-f277f',
    storageBucket: 'photonest-f277f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBEEsDaQk76SK8j0aB8cY-2lRKHqUyVlcU',
    appId: '1:213956856275:ios:c4ff5497190b5dc3148726',
    messagingSenderId: '213956856275',
    projectId: 'photonest-f277f',
    storageBucket: 'photonest-f277f.appspot.com',
    iosBundleId: 'com.example.photoNest',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBEEsDaQk76SK8j0aB8cY-2lRKHqUyVlcU',
    appId: '1:213956856275:ios:c4ff5497190b5dc3148726',
    messagingSenderId: '213956856275',
    projectId: 'photonest-f277f',
    storageBucket: 'photonest-f277f.appspot.com',
    iosBundleId: 'com.example.photoNest',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD-IBiyPwCmtPZkLhsx4MeFrYzy9IQUIi8',
    appId: '1:213956856275:web:18f47250b440246f148726',
    messagingSenderId: '213956856275',
    projectId: 'photonest-f277f',
    authDomain: 'photonest-f277f.firebaseapp.com',
    storageBucket: 'photonest-f277f.appspot.com',
    measurementId: 'G-T7GXJNR2FS',
  );
}
