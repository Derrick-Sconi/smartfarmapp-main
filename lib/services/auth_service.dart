import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  /// [authStateChanges] gets the state of the [User] whether signed in or out
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  /// Sign in with user [email] and [password]
  Future<String?> signIn(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return 'Signed in';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  /// Sign up with user [email] and [password]
  Future<String> signUp(
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      userCredential.user!.sendEmailVerification();
     return userCredential.user!.uid;

    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }

  /// Sign out user
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
