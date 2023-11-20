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
    apiKey: 'AIzaSyCEz7Gvj0D76XD1-IYg2QMoCXsfXlzPcFw',
    appId: '1:468678525993:web:d364ae24410a09d798c838',
    messagingSenderId: '468678525993',
    projectId: 'infiwheel-a2926',
    authDomain: 'infiwheel-a2926.firebaseapp.com',
    storageBucket: 'infiwheel-a2926.appspot.com',
    measurementId: 'G-3SD2LD8FF9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCZ0miNWrG-zDbXfPcwO5tc-Ml51bWCWSM',
    appId: '1:468678525993:android:8e0525b73f86b09c98c838',
    messagingSenderId: '468678525993',
    projectId: 'infiwheel-a2926',
    storageBucket: 'infiwheel-a2926.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDx4adtjoSgrjKSa_6cm8Jab47qZx9Q7wE',
    appId: '1:468678525993:ios:1dfd8e73d5570ea198c838',
    messagingSenderId: '468678525993',
    projectId: 'infiwheel-a2926',
    storageBucket: 'infiwheel-a2926.appspot.com',
    iosBundleId: 'com.example.infiWheel',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDx4adtjoSgrjKSa_6cm8Jab47qZx9Q7wE',
    appId: '1:468678525993:ios:78e0a0c594149aa598c838',
    messagingSenderId: '468678525993',
    projectId: 'infiwheel-a2926',
    storageBucket: 'infiwheel-a2926.appspot.com',
    iosBundleId: 'com.example.infiWheel.RunnerTests',
  );
}
