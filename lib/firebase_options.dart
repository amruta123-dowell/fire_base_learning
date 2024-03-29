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
    apiKey: 'AIzaSyBDKihsK7hqjy98MauGxMW3kdkFymAhE0U',
    appId: '1:896159490037:web:12ed15f6b25650fc450abc',
    messagingSenderId: '896159490037',
    projectId: 'fir-learning-20db3',
    authDomain: 'fir-learning-20db3.firebaseapp.com',
    storageBucket: 'fir-learning-20db3.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDTq70Y_wbnZGa1kEFHrsf_IW5pbNFpIpE',
    appId: '1:896159490037:android:c377097287821807450abc',
    messagingSenderId: '896159490037',
    projectId: 'fir-learning-20db3',
    storageBucket: 'fir-learning-20db3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCajRzsJJAa7FED5M3GcYfyRV-Fr0kPHDU',
    appId: '1:896159490037:ios:ee6b54c5cdfdff3d450abc',
    messagingSenderId: '896159490037',
    projectId: 'fir-learning-20db3',
    storageBucket: 'fir-learning-20db3.appspot.com',
    iosClientId: '896159490037-c5hh0rc7qgmfboch772bkdvqa85mpguv.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseLearning',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCajRzsJJAa7FED5M3GcYfyRV-Fr0kPHDU',
    appId: '1:896159490037:ios:5499e5eca6f814da450abc',
    messagingSenderId: '896159490037',
    projectId: 'fir-learning-20db3',
    storageBucket: 'fir-learning-20db3.appspot.com',
    iosClientId: '896159490037-1tqssqdraaan0k27tmfqpnfv1gurlavm.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseLearning.RunnerTests',
  );
}
