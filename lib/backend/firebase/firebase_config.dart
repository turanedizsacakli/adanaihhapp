import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDr0geALlbHIvYPhuBVLJmuqZNz_8zul5w",
            authDomain: "adanaihhapp.firebaseapp.com",
            projectId: "adanaihhapp",
            storageBucket: "adanaihhapp.appspot.com",
            messagingSenderId: "664135631380",
            appId: "1:664135631380:web:2797b6f193daafa0871d01"));
  } else {
    await Firebase.initializeApp();
  }
}
