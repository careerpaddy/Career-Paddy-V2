import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBejAZAs51n7LcrB0yk1NtxCVU95BVFE9c",
            authDomain: "career-paddy.firebaseapp.com",
            projectId: "career-paddy",
            storageBucket: "career-paddy.appspot.com",
            messagingSenderId: "429531477012",
            appId: "1:429531477012:web:141cfda6517fdb0db7e301",
            measurementId: "G-C6KXB2TRKS"));
  } else {
    await Firebase.initializeApp();
  }
}
