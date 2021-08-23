import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/datasources/user_datasource.dart';
import '../../../core/model/user.dart';
import 'auth_provider.dart';
import 'firebase_providers.dart';

final userDataSourceProvider = Provider<UserDataSource>(
  (ref) => UserDataSource(ref.watch(firestoreProvider)),
);

final currentUserProvider = StreamProvider<User>((ref) {
  final currentAuthUser = ref.watch(currentAuthUserProvider);
  final userDataSource = ref.watch(userDataSourceProvider);

  return userDataSource.getUserStream(currentAuthUser!.uid);
});

final userProvider = Provider<User>((ref) {
  final currentUser = ref.watch(currentUserProvider);

  return currentUser.maybeWhen(
    data: (user) => user,
    orElse: () => User(),
    error: (error, stack) {
      print(error);
      print(stack);
      return User();
    },
  );
});

final imagePickerProvider = Provider<ImagePicker>((ref) => ImagePicker());
