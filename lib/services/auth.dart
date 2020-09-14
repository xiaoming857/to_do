import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class Auth {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User> signInWithGoogle() async {
    GoogleSignInAccount googleSignInAccount = await this.googleSignIn.signIn();

    if (googleSignInAccount != null) {
      GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
      GoogleAuthCredential googleAuthCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      return this.firebaseAuth.signInWithCredential(googleAuthCredential).then((value) => value.user);
    }

    return null;
  }


  Future<void> signOut() async {
    User user = this.firebaseAuth.currentUser;

    if (user.providerData[0].providerId == 'google.com') {
      await this.googleSignIn.disconnect();
    }

    await this.firebaseAuth.signOut();
  }
}