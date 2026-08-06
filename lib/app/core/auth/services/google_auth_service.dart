import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential?> signInWithGoogle() async {
    // Ask user to choose a google account
    final GoogleSignInAccount googleUser = await GoogleSignIn.instance.authenticate();

    // Get google tokens
    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    // Create firebase credential
    final credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken);

    // Login to firebase
    return await _firebaseAuth.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    await GoogleSignIn.instance.signOut();
    await _firebaseAuth.signOut();
  }
}