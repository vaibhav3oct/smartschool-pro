import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return const FirebaseOptions(
      apiKey: 'REPLACE_WITH_FIREBASE_API_KEY',
      appId: 'REPLACE_WITH_FIREBASE_APP_ID',
      messagingSenderId: 'REPLACE_WITH_FIREBASE_MESSAGING_SENDER_ID',
      projectId: 'smartschool-pro-demo',
      authDomain: 'smartschool-pro-demo.firebaseapp.com',
      storageBucket: 'smartschool-pro-demo.appspot.com',
      measurementId: 'REPLACE_WITH_FIREBASE_MEASUREMENT_ID',
      iosBundleId: 'com.cybaware.smartschoolpro',
      iosClientId: 'REPLACE_WITH_FIREBASE_IOS_CLIENT_ID',
      androidClientId: 'REPLACE_WITH_FIREBASE_ANDROID_CLIENT_ID',
    );
  }
}
