import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user.dart';

class UserDataSource {
  UserDataSource(this._firestore);

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get users =>
      _firestore.collection('users');

  CollectionReference<User> get userRef => users.withConverter<User>(
        fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
        toFirestore: (user, _) => user.toJson(),
      );

  Stream<QuerySnapshot<Map<String, dynamic>>> get usersStream =>
      users.snapshots();

  Future<User> addUser(User user) async {
    await userRef.doc(user.uid).set(user);

    return user;
  }

  Future<void> deleteUser(String id) async {
    try {
      return await userRef.doc(id).delete();
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  Future<User> getUser(String id) async {
    return await userRef.doc(id).get().then((snapshot) => snapshot.data()!);
  }

  Future<User> getUserByUserNumber(String userNumber) async {
    return await userRef
        .where('username', isEqualTo: userNumber)
        .get()
        .then((snapshot) => snapshot.docs.first.data());
  }

  Stream<User> getUserStream(String id) {
    try {
      final userStream = userRef.where('uid', isEqualTo: id).snapshots();
      return userStream.map(
          (queryDocumentSnapshot) => queryDocumentSnapshot.docs.first.data());
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<User> updateUser(User user) async {
    try {
      await userRef.doc(user.uid).update(user.toJson());
      return user;
    } catch (e) {
      print(e);
      throw (e);
    }
  }
}
