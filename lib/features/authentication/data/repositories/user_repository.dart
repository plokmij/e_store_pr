import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store_pr/features/authentication/data/models/user_model.dart';

class UserRepository {
  final FirebaseFirestore _firestore;

  UserRepository() : _firestore = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.uid).set(user.toMap());
    } catch (e) {
      throw Exception(e);
    }
  }
}
