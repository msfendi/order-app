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
    apiKey: 'AIzaSyBbtgkSigs7HJDvg1tNgiIrkXvui-wryFY',
    appId: '1:747462675906:web:9d2c972bb59aee2dc21a5b',
    messagingSenderId: '747462675906',
    projectId: 'food-ptik',
    authDomain: 'food-ptik.firebaseapp.com',
    storageBucket: 'food-ptik.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD6swp7RsywelHoCn-7GTzIOWswCaoHP3A',
    appId: '1:747462675906:android:b4d31f20561e3250c21a5b',
    messagingSenderId: '747462675906',
    projectId: 'food-ptik',
    storageBucket: 'food-ptik.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBBi2l1-PaHgHDYcDQ9uxLpv88EO2_0sRg',
    appId: '1:747462675906:ios:cf679f651ae4d20bc21a5b',
    messagingSenderId: '747462675906',
    projectId: 'food-ptik',
    storageBucket: 'food-ptik.appspot.com',
    iosClientId: '747462675906-5fjk3foluoqcnvh329rfpdoqm5kpdjfk.apps.googleusercontent.com',
    iosBundleId: 'com.example.ptikFood',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBBi2l1-PaHgHDYcDQ9uxLpv88EO2_0sRg',
    appId: '1:747462675906:ios:cf679f651ae4d20bc21a5b',
    messagingSenderId: '747462675906',
    projectId: 'food-ptik',
    storageBucket: 'food-ptik.appspot.com',
    iosClientId: '747462675906-5fjk3foluoqcnvh329rfpdoqm5kpdjfk.apps.googleusercontent.com',
    iosBundleId: 'com.example.ptikFood',
  );
}