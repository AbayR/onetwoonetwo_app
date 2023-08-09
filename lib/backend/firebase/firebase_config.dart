import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDhSlvDOjeSu_ZJ1GqFbCe_qz_fjkzsf58",
            authDomain: "onetwoonetwoapp.firebaseapp.com",
            projectId: "onetwoonetwoapp",
            storageBucket: "onetwoonetwoapp.appspot.com",
            messagingSenderId: "239453495460",
            appId: "1:239453495460:web:6b10ffb404927912b68631",
            measurementId: "G-J9VEE2B197"));
  } else {
    await Firebase.initializeApp();
  }
}
