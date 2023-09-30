import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

import 'image_picker_option.dart';

class AppImagePickerService {
  final ImagePickerOptions selectedOption;

  AppImagePickerService({
    required this.selectedOption,
  });

  Uint8List? userSelectedFileDetails;
  late final Uint8List? _fileBytes;
  late final String _fileName;
  late final XFile? userSelection;

  ///This method will open the picker and user can select an image or a pdf file.
  ///Returns - size of file or image picked up by user.
  Future<int> pick() async {
    switch (selectedOption) {
      case ImagePickerOptions.takePhotoFromCamera:
        userSelection = await ImagePicker().pickImage(
          source: ImageSource.camera,
          maxHeight: 500,
          maxWidth: 500,
        );
        _fileBytes = await userSelection?.readAsBytes();
        _fileName = userSelection?.name ?? '';
        break;
      case ImagePickerOptions.chooseFromGallery:
        userSelection = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          maxHeight: 500,
          maxWidth: 500,
        );
        _fileBytes = await userSelection?.readAsBytes();
        _fileName = userSelection?.name ?? '';
        break;
    }

    if (_fileBytes == null) {
      return 0;
    } else {
      int fileSize = _fileBytes!.lengthInBytes;
      return fileSize ~/ (1024 * 1024);
    }
  }

  bool isFilePicked() => _fileBytes != null && _fileName.isNotEmpty;

  ///This method needs to be called after size of image or file picked up by user is less then 1 mb.
  ImageFilePickReturn getFile() {
    switch (selectedOption) {
      case ImagePickerOptions.takePhotoFromCamera:
        userSelectedFileDetails = _fileBytes;
        break;
      case ImagePickerOptions.chooseFromGallery:
        userSelectedFileDetails = _fileBytes;
        break;
    }

    return ImageFilePickReturn(
      userSelectedFileDetails:
          ImageDetails(imageBytes: _fileBytes, fileName: _fileName),
      selectedOption: selectedOption,
    );
  }
}

class ImageFilePickReturn {
  final ImageDetails userSelectedFileDetails;
  final ImagePickerOptions selectedOption;

  ImageFilePickReturn({
    required this.userSelectedFileDetails,
    required this.selectedOption,
  });
}

class ImageDetails {
  final Uint8List? imageBytes;
  final String fileName;

  ImageDetails({
    required this.imageBytes,
    required this.fileName,
  });
}
