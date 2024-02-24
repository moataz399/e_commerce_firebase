import 'package:cloud_firestore/cloud_firestore.dart';

import '../../features/register/data/models/user_model.dart';

class FireStoreServices {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<void> addUserToFireStore(UserModel userModel) async {
    _db.collection('users').doc(userModel.userId).set(userModel.toJson());
  }

  Future<void> deleteUserFromFireStore(UserModel userModel) async {
    await _db.collection('users').doc(userModel.userId).delete();
  }
}
