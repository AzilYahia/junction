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
    apiKey: 'AIzaSyCAJPSif91l3EXlZ5U82BVHbdZNZ69Zb_Y',
    appId: '1:497395028820:web:abc72eaca559c6ab246ec1',
    messagingSenderId: '497395028820',
    projectId: 'a-gpt-c8c0a',
    authDomain: 'a-gpt-c8c0a.firebaseapp.com',
    storageBucket: 'a-gpt-c8c0a.appspot.com',
    measurementId: 'G-90DYQ8386X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD-6BefVmtHMoG-_brASInfkzvZ6UXc1D0',
    appId: '1:497395028820:android:a6a30faeb6846ad1246ec1',
    messagingSenderId: '497395028820',
    projectId: 'a-gpt-c8c0a',
    storageBucket: 'a-gpt-c8c0a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBwwZTKxqeGrOrOF8U8Axdv6sz5z5_DZkA',
    appId: '1:497395028820:ios:24ddf837c467688c246ec1',
    messagingSenderId: '497395028820',
    projectId: 'a-gpt-c8c0a',
    storageBucket: 'a-gpt-c8c0a.appspot.com',
    iosClientId: '497395028820-96mn3optthas4g8eb28te1h6pcmqqf9v.apps.googleusercontent.com',
    iosBundleId: 'com.example.junction',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBwwZTKxqeGrOrOF8U8Axdv6sz5z5_DZkA',
    appId: '1:497395028820:ios:24ddf837c467688c246ec1',
    messagingSenderId: '497395028820',
    projectId: 'a-gpt-c8c0a',
    storageBucket: 'a-gpt-c8c0a.appspot.com',
    iosClientId: '497395028820-96mn3optthas4g8eb28te1h6pcmqqf9v.apps.googleusercontent.com',
    iosBundleId: 'com.example.junction',
  );
}
