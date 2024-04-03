import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDQRIhEmOftd2-Fl7fXlrpKSyRM_Gd92BE",
            authDomain: "adanaihh-64cf5.firebaseapp.com",
            projectId: "adanaihh-64cf5",
            storageBucket: "adanaihh-64cf5.appspot.com",
            messagingSenderId: "267782923497",
            appId: "1:267782923497:web:45b4d0dc9854b59f503c78"));
  } else {
    await Firebase.initializeApp();
  }
}
