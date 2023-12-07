// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter_dotenv/flutter_dotenv.dart';

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

Future<void> main() async {
  await dotenv.load(fileName: 'serviceKeys.env');
}

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

  static FirebaseOptions web = FirebaseOptions(
    apiKey: dotenv.env['fbWebAPIKey']!,
    appId: dotenv.env['fbWebAppID']!,
    messagingSenderId: dotenv.env['fbMsgSenderID']!,
    projectId: dotenv.env['fbWebProjectID']!,
    authDomain: dotenv.env['fbWebAuthDomain']!,
    storageBucket: dotenv.env['fbWebStorageBucket']!,
  );

  static FirebaseOptions android = FirebaseOptions(
    apiKey: dotenv.env['fbAndroidAPIKey']!,
    appId: dotenv.env['fbAndroidAppID']!,
    messagingSenderId: dotenv.env['fbAndroidMsgSenderID']!,
    projectId: dotenv.env['fbAndroidProjectID']!,
    storageBucket: dotenv.env['fbAndroidStorageBucket']!,
  );

  static FirebaseOptions ios = FirebaseOptions(
    apiKey: dotenv.env['fbIOSAPIKey']!,
    appId: dotenv.env['fbIOSAppID']!,
    messagingSenderId: dotenv.env['fbIOSMsgSenderID']!,
    projectId: dotenv.env['fbIOSProjectID']!,
    storageBucket: dotenv.env['fbIOSStorageBucket']!,
    iosBundleId: dotenv.env['fbIOSBundleID']!,
  );

  static FirebaseOptions macos = FirebaseOptions(
    apiKey: dotenv.env['fbMacOSAPIKey']!,
    appId: dotenv.env['fbMacOSAppID']!,
    messagingSenderId: dotenv.env['fbMacOSMsgSenderID']!,
    projectId: dotenv.env['fbMacOSProjectID']!,
    storageBucket: dotenv.env['fbMacOSStorageBucket']!,
    iosBundleId: dotenv.env['fbMacOSBundleID']!,
  );
}
