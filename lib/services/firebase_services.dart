import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseServices {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Map? currentUser;

  FirebaseServices();

  // Login a user;
  Future<bool> loginUser(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      currentUser = await getUserInfo(uid: userCredential.user!.uid);
      if (userCredential.user != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  // Get user info
  Future<Map> getUserInfo({required String uid}) async {
    DocumentSnapshot userInfo =
        await fireStore.collection('users').doc(uid).get();
    return userInfo.data() as Map;
  }
}
