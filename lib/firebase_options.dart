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
    apiKey: 'AIzaSyBhuoT27ccenpl0thnjRPXsuLKx4DwNpAw',
    appId: '1:439008963840:web:6f2ef87e96965b76c617e5',
    messagingSenderId: '439008963840',
    projectId: 'pengaduansamsat',
    authDomain: 'pengaduansamsat.firebaseapp.com',
    storageBucket: 'pengaduansamsat.firebasestorage.app',
    measurementId: 'G-GNR5HNCEWF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAh-nZbXedECi81bHhIbHNivY9Fw1LzZEU',
    appId: '1:439008963840:android:5eb1d087f7442fc1c617e5',
    messagingSenderId: '439008963840',
    projectId: 'pengaduansamsat',
    storageBucket: 'pengaduansamsat.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDX3XSU1oH7ZdcvLbKD9GH-O4QCBpNgSCY',
    appId: '1:439008963840:ios:944e8d3752adfdcfc617e5',
    messagingSenderId: '439008963840',
    projectId: 'pengaduansamsat',
    storageBucket: 'pengaduansamsat.firebasestorage.app',
    iosBundleId: 'com.example.kepuasanlayanan',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDX3XSU1oH7ZdcvLbKD9GH-O4QCBpNgSCY',
    appId: '1:439008963840:ios:944e8d3752adfdcfc617e5',
    messagingSenderId: '439008963840',
    projectId: 'pengaduansamsat',
    storageBucket: 'pengaduansamsat.firebasestorage.app',
    iosBundleId: 'com.example.kepuasanlayanan',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBhuoT27ccenpl0thnjRPXsuLKx4DwNpAw',
    appId: '1:439008963840:web:90d6baca2d60ea41c617e5',
    messagingSenderId: '439008963840',
    projectId: 'pengaduansamsat',
    authDomain: 'pengaduansamsat.firebaseapp.com',
    storageBucket: 'pengaduansamsat.firebasestorage.app',
    measurementId: 'G-R558BFKN3R',
  );

}