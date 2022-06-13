import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<bool> signInWithGoogle() async {
    bool res = false;

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken
      );
      UserCredential userCredential = await auth.signInWithCredential(credential);

      User? user = userCredential.user;

      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          await firestore.collection('users').doc(user.uid).set({
            'username': user.displayName,
            'uid': user.uid,
            'profilePhoto': user.photoURL
          });
        }
        res = true;
      }
    } catch(e) {
      res = false;
      print(e);
    }
  }
}