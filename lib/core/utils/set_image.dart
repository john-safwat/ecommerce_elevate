import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> pickImage(BuildContext context) async {
  File? image;
  ImagePicker picker = ImagePicker();
  var locale = AppLocalizations.of(context)!;

  final source = await showDialog<ImageSource>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            locale.chooseProfilePhoto,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, ImageSource.camera),
              child: Row(
                children: [
                  const Icon(Icons.camera_alt),
                  const SizedBox(width: 5),
                  Text(
                    locale.camera,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, ImageSource.gallery),
              child: Row(
                children: [
                  const Icon(Icons.photo_library),
                  const SizedBox(width: 5),
                  Text(
                    locale.gallery,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ],
        );
      });

  if (source != null) {
    final pickedFile = await picker.pickImage(source: source);

    image = File(pickedFile!.path);
  }
  return image;
}
