import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  final FirebaseAuth _fbAuth = FirebaseAuth.instance;

  Future<UserCredential?> registerAkun({
    required String email,
    required String password,
  }) async {
    // register akun menggunakan email dan password
    var user = await _fbAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return user;
  }

  Future<UserCredential?> loginAkun({
    required String email,
    required String password,
  }) async {
    // authorization menggunakan email dan password
    var user = await _fbAuth.signInWithEmailAndPassword(
        email: email, password: password);

    return user;
  }

  Future logout() async {
    _fbAuth.signOut();
    // logout dan clear database hive
    // var box = await Hive.openBox('userBox');
    // box.clear();
  }
}
