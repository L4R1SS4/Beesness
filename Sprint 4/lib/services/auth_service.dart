import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? get currentUser => auth.currentUser;
  Stream<User?> get authStateChanges => auth.authStateChanges();

  Future<void> signIn({
    required String email,
    required String senha,
  }) async {
    await auth.signInWithEmailAndPassword(email: email, password: senha);
  }

  Future<void> cadastro({
    required String email,
    required String senha,
  }) async {
    await auth.createUserWithEmailAndPassword(email: email, password: senha);
  }

  Future<void> signOut() async {
    await auth.signOut();
  }

}