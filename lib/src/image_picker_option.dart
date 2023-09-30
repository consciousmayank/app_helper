import 'package:flutter/material.dart';

enum ImagePickerOptions {
  takePhotoFromCamera,
  chooseFromGallery,
}

extension ImagePdfFilePickupOptionsExtension on ImagePickerOptions {
  String optionsToString({required BuildContext context}) {
    switch (this) {
      case ImagePickerOptions.takePhotoFromCamera:
        return 'Take Photo';

      case ImagePickerOptions.chooseFromGallery:
        return 'Choose from Gallery';
    }
  }

  ImagePickerOptions? stringToOption({
    required BuildContext context,
    required String value,
  }) {
    if (value ==
        ImagePickerOptions.takePhotoFromCamera
            .optionsToString(context: context)) {
      return ImagePickerOptions.takePhotoFromCamera;
    } else if (value ==
        ImagePickerOptions.chooseFromGallery
            .optionsToString(context: context)) {
      return ImagePickerOptions.chooseFromGallery;
    }
  }
}
