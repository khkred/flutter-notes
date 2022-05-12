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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBOF4JZ52hUPL9Pi-8FDvozMQiy3uf1-3Y',
    appId: '1:585054326343:android:1a61724458b983b642ab62',
    messagingSenderId: '585054326343',
    projectId: 'fir-demo-6e072',
    storageBucket: 'fir-demo-6e072.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDCOROJmpPCDzJBwRHPLbkelqusZi6mkfk',
    appId: '1:585054326343:ios:a7b4b93f681a304142ab62',
    messagingSenderId: '585054326343',
    projectId: 'fir-demo-6e072',
    storageBucket: 'fir-demo-6e072.appspot.com',
    iosClientId: '585054326343-9na12tarptt7d9nelp9ntumhcf3rnjgb.apps.googleusercontent.com',
    iosBundleId: 'com.example.carFirebase',
  );
}