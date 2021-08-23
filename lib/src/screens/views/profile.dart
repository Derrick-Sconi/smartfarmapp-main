import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../providers/app_providers.dart';
import '../providers/auth_provider.dart';
import '../utils/dialog.dart';
import '../widgets/t_text_form_field.dart';

final nameProvider = StateProvider.autoDispose<TextEditingController>((ref) {
  final user = ref.watch(userProvider);
  return TextEditingController(text: user.name);
});

final emailProvider = StateProvider.autoDispose<TextEditingController>((ref) {
  final user = ref.watch(userProvider);
  return TextEditingController(text: user.email);
});

final phoneNumberProvider =
    StateProvider.autoDispose<TextEditingController>((ref) {
  final user = ref.watch(userProvider);
  return TextEditingController(text: user.phoneNumber);
});

final imagePathProvider = StateProvider.autoDispose<String>((ref) => '');

class ProfileScreen extends ConsumerWidget {
  Future getImage(BuildContext context,
      {required ImageSource imageSource}) async {
    final imagePicker = context.read(imagePickerProvider);
    // picks image from camera
    var pickedImage = await imagePicker.pickImage(source: imageSource);
    if (pickedImage == null) {
      return;
    }

    String externalStoragePath = (await getExternalStorageDirectory())!.path;
    var fileName = basename(pickedImage.path);

    // copy image file to a new path
    File newImage =
        await File(pickedImage.path).copy('$externalStoragePath/$fileName');
    // set image path
    context.read(imagePathProvider).state = newImage.path;
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _authService = watch(authServiceProvider);
    final name = watch(nameProvider);
    final email = watch(emailProvider);
    final phoneNumber = watch(phoneNumberProvider);
    final imagePath = watch(imagePathProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Theme.of(context).primaryColor),
            onPressed: () async {
              await _authService.signOut();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 10.0, right: 20.0, bottom: 20.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              height: 100.0,
              width: 100.0,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF2A3736).withOpacity(0.1),
                      image: imagePath.state.isNotEmpty
                          ? imagePath.state.contains('gs:')
                              ? DecorationImage(
                                  image: NetworkImage(imagePath.state),
                                  fit: BoxFit.cover,
                                )
                              : DecorationImage(
                                  image: FileImage(File(imagePath.state)),
                                  fit: BoxFit.cover,
                                )
                          : null,
                    ),
                    height: 100.0,
                    width: 100.0,
                  ),
                  Positioned(
                    bottom: 0,
                    top: 70,
                    left: 65,
                    child: IconButton(
                      onPressed: () => showCustomDialog(
                        context,
                        titleBuilder: (context, controller, setState) =>
                            SizedBox(),
                        messageBuilder: (context, controller, setState) =>
                            Column(
                          children: [
                            TextButton(
                              onPressed: () async {
                                await getImage(
                                  context,
                                  imageSource: ImageSource.camera,
                                );
                                controller.dismiss();
                              },
                              child: Text(
                                'Camera',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                await getImage(
                                  context,
                                  imageSource: ImageSource.gallery,
                                ).then((value) => controller.dismiss());
                              },
                              child: Text(
                                'Gallery',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            )
                          ],
                        ),
                        negativeAction: (context, controller, setState) =>
                            SizedBox(),
                        positiveAction: (context, controller, setState) =>
                            SizedBox(),
                      ),
                      icon: Icon(
                        Icons.photo_camera,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            TTextFormField(
              controller: name.state,
              iconData: Icons.person,
              text: 'Name',
            ),
            SizedBox(height: 20.0),
            TTextFormField(
              controller: email.state,
              iconData: Icons.message,
              text: 'Email',
            ),
            SizedBox(height: 20.0),
            TTextFormField(
              controller: phoneNumber.state,
              iconData: Icons.dialpad,
              text: 'Phone number',
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
