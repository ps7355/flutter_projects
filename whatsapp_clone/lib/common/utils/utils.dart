import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> ShowSnackBar(
    {required String message, required BuildContext context}) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(message)));
}

Future<File?> PickFromGallery(BuildContext context) async {
  File? image;
  try {
    final pickedimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedimage != null) {
      image = File(pickedimage.path);
    }
  } catch (e) {
    ShowSnackBar(message: e.toString(), context: context);
  }
  return image;
}
