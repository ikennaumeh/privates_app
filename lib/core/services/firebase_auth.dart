import 'package:firebase_auth/firebase_auth.dart';

/// link for documentation - https://firebase.flutter.dev/docs/auth/manage-users

class FirebaseService{

  late FirebaseAuth _auth;

  FirebaseService(){
    _auth = FirebaseAuth.instance;
  }


  Future<User?>registerUser({required String email, required String password}) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    ///await userCredential.user?.sendEmailVerification();
    return userCredential.user;
  }

  Future<User?> login({required String email, required String password}) async {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }

  Future<void> setEmail({required String email}) async {
    await _auth.currentUser?.updateEmail(email);
  }

  Future<void> setFullName({required String fullName}) async {
    await _auth.currentUser?.updateDisplayName(fullName);
  }

  Future<void> setPhoneNumber({required PhoneAuthCredential phoneCredential}) async {
    await _auth.currentUser?.updatePhoneNumber(phoneCredential);
  }

  Future<void> deleteAccount() async {
    await _auth.currentUser?.delete();
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  User? getUser() {
    return _auth.currentUser;
  }
}