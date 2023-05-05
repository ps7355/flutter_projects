import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/common/utils/utils.dart';
import 'package:whatsapp_clone/features/auth/controller/auth_controller.dart';

class UserInformationScreen extends ConsumerStatefulWidget {
  static const String routeName = '/user-information-screen';
  const UserInformationScreen({super.key});

  @override
  ConsumerState<UserInformationScreen> createState() =>
      _UserInformationScreenState();
}

final NameController = TextEditingController();

class _UserInformationScreenState extends ConsumerState<UserInformationScreen> {
  File? image;
  Future<File?> selectuserprofile(BuildContext context) async {
    image = await PickFromGallery(context);
    setState(() {});
  }

  void saveUserToFireBase() {
    final name = NameController.text.trim();
    if (name != null) {
      ref.read(AuthControllerProvider).saveUserToFirebase(name, image, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                image == null
                    ? CircleAvatar(
                        radius: 60,
                        backgroundImage: const NetworkImage(
                            'https://picsum.photos/250?image=9'),
                      )
                    : CircleAvatar(
                        radius: 60,
                        backgroundImage: FileImage(image!),
                      ),
                Positioned(
                    child: IconButton(
                        onPressed: () {
                          selectuserprofile(context);
                        },
                        icon: Icon(Icons.camera))),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
            Center(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(18),
                    width: size.width * 0.85,
                    child: TextField(
                      controller: NameController,
                      decoration: InputDecoration(hintText: "Enter Your Name"),
                    ),
                  ),
                  IconButton(
                      onPressed: saveUserToFireBase, icon: Icon(Icons.done))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
