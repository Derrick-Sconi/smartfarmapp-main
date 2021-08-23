import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../services/auth_service.dart';

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final authServiceProvider = Provider<AuthenticationService>(
    (ref) => AuthenticationService(ref.read(firebaseAuthProvider)));

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.read(authServiceProvider).authStateChanges;
});

final currentAuthUserProvider =
    Provider<User?>((ref) => ref.watch(firebaseAuthProvider).currentUser);
