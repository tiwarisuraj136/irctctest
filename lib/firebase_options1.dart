// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options1.dart';
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
    apiKey: 'AIzaSyDWo0sExp7KnuGxgFpb8AdaroHChg8DWbU',
    appId: '1:194687063293:web:80b5267ad91d560656da94',
    messagingSenderId: '194687063293',
    projectId: 'fir-getx-9a512',
    authDomain: 'fir-getx-9a512.firebaseapp.com',
    storageBucket: 'fir-getx-9a512.appspot.com',
    measurementId: 'G-4KRZPG6F7G',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC0pK487jJqTmy-j4jScSBHjCCj0TZ1d2w',
    appId: '1:194687063293:android:ec8640ce8365377956da94',
    messagingSenderId: '194687063293',
    projectId: 'fir-getx-9a512',
    storageBucket: 'fir-getx-9a512.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCa23ZdAOYjp1GO8GBTi-xwgMPXFOTN3wQ',
    appId: '1:194687063293:ios:c3ca99bafd7bed8856da94',
    messagingSenderId: '194687063293',
    projectId: 'fir-getx-9a512',
    storageBucket: 'fir-getx-9a512.appspot.com',
    iosBundleId: 'com.example.firebaseGetx',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCa23ZdAOYjp1GO8GBTi-xwgMPXFOTN3wQ',
    appId: '1:194687063293:ios:c3ca99bafd7bed8856da94',
    messagingSenderId: '194687063293',
    projectId: 'fir-getx-9a512',
    storageBucket: 'fir-getx-9a512.appspot.com',
    iosBundleId: 'com.example.firebaseGetx',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDWo0sExp7KnuGxgFpb8AdaroHChg8DWbU',
    appId: '1:194687063293:web:b512fafd4147603856da94',
    messagingSenderId: '194687063293',
    projectId: 'fir-getx-9a512',
    authDomain: 'fir-getx-9a512.firebaseapp.com',
    storageBucket: 'fir-getx-9a512.appspot.com',
    measurementId: 'G-YVG5ZQV6C4',
  );
}
