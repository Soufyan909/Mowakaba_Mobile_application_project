import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBBAgWqPBRpiJzj-LTl8yUIwqE1_wT1gCM",
            authDomain: "mowakkaba-application-ec012.firebaseapp.com",
            projectId: "mowakkaba-application-ec012",
            storageBucket: "mowakkaba-application-ec012.firebasestorage.app",
            messagingSenderId: "690505520597",
            appId: "1:690505520597:web:cc85441e6aaa56b881995c"));
  } else {
    await Firebase.initializeApp();
  }
}
