import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAZjeGowvLz_OQMKLjWnWqZyHBHEtr8TtU",
            authDomain: "markcdia.firebaseapp.com",
            projectId: "markcdia",
            storageBucket: "markcdia.appspot.com",
            messagingSenderId: "162577024912",
            appId: "1:162577024912:web:4434944fa86db0bc289515",
            measurementId: "G-7MT4KTTJB1"));
  } else {
    await Firebase.initializeApp();
  }
}
