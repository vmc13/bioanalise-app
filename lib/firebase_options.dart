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
    apiKey: 'AIzaSyB-1ER6pTQd0IrwTubmjQMrOzh9nv7_Cb8',
    appId: '1:835002627877:web:ea5cc8ed6ec2cf1e1a8ccc',
    messagingSenderId: '835002627877',
    projectId: 'bioanalise-4289e',
    authDomain: 'bioanalise-4289e.firebaseapp.com',
    storageBucket: 'bioanalise-4289e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDtxNw3dzZPm24wi6RKNFt1MxY3kWmNsIc',
    appId: '1:835002627877:android:56029ef0582bcaa11a8ccc',
    messagingSenderId: '835002627877',
    projectId: 'bioanalise-4289e',
    storageBucket: 'bioanalise-4289e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDFHYw2JKoQzb_YLH6bIYemybWAtSNHCAc',
    appId: '1:835002627877:ios:788725e79f0998321a8ccc',
    messagingSenderId: '835002627877',
    projectId: 'bioanalise-4289e',
    storageBucket: 'bioanalise-4289e.appspot.com',
    iosClientId: '835002627877-h0h386jle10i6lbgfpsbrhli3ruisrdl.apps.googleusercontent.com',
    iosBundleId: 'com.example.bioanaliseApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDFHYw2JKoQzb_YLH6bIYemybWAtSNHCAc',
    appId: '1:835002627877:ios:788725e79f0998321a8ccc',
    messagingSenderId: '835002627877',
    projectId: 'bioanalise-4289e',
    storageBucket: 'bioanalise-4289e.appspot.com',
    iosClientId: '835002627877-h0h386jle10i6lbgfpsbrhli3ruisrdl.apps.googleusercontent.com',
    iosBundleId: 'com.example.bioanaliseApp',
  );
}
