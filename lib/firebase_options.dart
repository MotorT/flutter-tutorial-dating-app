// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyArJfUERq672ODjloDyaZJn2zbRXTXdhaE',
    appId: '1:788360615710:web:8502f594cac31920851b0f',
    messagingSenderId: '788360615710',
    projectId: 'timemama-b',
    authDomain: 'timemama-b.firebaseapp.com',
    storageBucket: 'timemama-b.appspot.com',
    measurementId: 'G-3KTTEZN6HW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA5vbrEnWXLZUAYvVPDO-_ImAqqArup_aA',
    appId: '1:788360615710:android:f9effd453fa0b495851b0f',
    messagingSenderId: '788360615710',
    projectId: 'timemama-b',
    storageBucket: 'timemama-b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCPIAmXVDnWdjAMlNjPoXHB0PgpPwtivd0',
    appId: '1:788360615710:ios:7fda880467ef6b5b851b0f',
    messagingSenderId: '788360615710',
    projectId: 'timemama-b',
    storageBucket: 'timemama-b.appspot.com',
    iosClientId: '788360615710-dbfia84upujb5vdths5k22mliijb17bv.apps.googleusercontent.com',
    iosBundleId: 'com.example.app',
  );
}
