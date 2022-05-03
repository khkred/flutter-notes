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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCbAyz1JjK5PsdaxbRAYNSiirOGXSxh3yY',
    appId: '1:585054326343:web:e5c1a696e3ed94e942ab62',
    messagingSenderId: '585054326343',
    projectId: 'fir-demo-6e072',
    authDomain: 'fir-demo-6e072.firebaseapp.com',
    storageBucket: 'fir-demo-6e072.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBOF4JZ52hUPL9Pi-8FDvozMQiy3uf1-3Y',
    appId: '1:585054326343:android:2820d1b2fb6441b742ab62',
    messagingSenderId: '585054326343',
    projectId: 'fir-demo-6e072',
    storageBucket: 'fir-demo-6e072.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDCOROJmpPCDzJBwRHPLbkelqusZi6mkfk',
    appId: '1:585054326343:ios:79f6f747f2b8145242ab62',
    messagingSenderId: '585054326343',
    projectId: 'fir-demo-6e072',
    storageBucket: 'fir-demo-6e072.appspot.com',
    iosClientId: '585054326343-3k38in4q3nrvlil10u6uf8ghn2sst5p0.apps.googleusercontent.com',
    iosBundleId: 'com.example.petFirebase',
  );
}