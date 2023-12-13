import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:infi_wheel/features/authentication/data/models/user_model.dart';
import 'package:infi_wheel/features/authentication/domain/entities/user_entity.dart';
import 'package:infi_wheel/features/authentication/domain/repositories/user_repository.dart';

class FirebaseUserRepository implements UserRepository {
  FirebaseUserRepository({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;
  final usersCollection = FirebaseFirestore.instance.collection('users');
  
  @override
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser;
      return user;
    });
  }

  @override
  Future<void> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  @override
  Future<UserModel> signUp(UserModel user, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );

      user = user.copyWith(id: userCredential.user!.uid);

      return user;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<void> setUserData(UserModel user) async {
    try {
      await usersCollection.doc(user.id).set(user.toEntity().toDocument());
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  @override
  Future<UserModel> getUser(String userID) async {
    try {
      return usersCollection.doc(userID).get().then((value) =>
          UserModel.fromEntity(UserEntity.fromDocument(value.data()!)));
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
