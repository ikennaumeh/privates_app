import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class ImageService {
  Logger log = Logger();
  final ImagePicker _imagePicker = ImagePicker();

  ImageService();

  /// This function helps to crop the image given to it and returns
  Future<File> _cropImage(File file) async {
    log.i('Picked image for cropping: ${file.path}');
    // default file holder
    File _croppedImage;
    // Get Image Properties
    final ImageProperties _properties =
    await FlutterNativeImage.getImageProperties(file.path);

    // checking if the height of the selected image is greater than the width
    if (_properties.height! > _properties.width!) {
      // Logic to get the Y origin to resize
      final double _yOffSet = (_properties.height! - _properties.width!) / 2;

      // crop the image with predefined logic preference
      _croppedImage = await FlutterNativeImage.cropImage(file.path, 0,
          _yOffSet.toInt(), _properties.width!, _properties.width!);

      // checking if the width of the selected image is greater than the height
    } else if (_properties.width! > _properties.height!) {
      // Logic to get the X orgin to resize
      final double _xOffSet = (_properties.width! - _properties.height!) / 2;

      // crop the image with predefined logic preference
      _croppedImage = await FlutterNativeImage.cropImage(file.path,
          _xOffSet.toInt(), 0, _properties.height!, _properties.height!);

      // the selected image has the same height and with, we return it
    } else {
      _croppedImage = file;
    }
    return _croppedImage;
  }

  /// This function helps to compress the image given to it and returns
  Future<File> _compressImage(File file) async {
    log.i('Picked image for compressing: ${file.path}');

    // default file holder
    File _compressedImage;

    // Compress the selected image with predefined properties
    _compressedImage = await FlutterNativeImage.compressImage(file.path,
        quality: 100, targetHeight: 600, targetWidth: 600);
    return _compressedImage;
  }

  Future<PlatformFile?> pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    return result?.files.first;

  }

  /// This is an interfacing function for the inbuilt separate [Cropping] and [Compressing] logics
  Future<File> cropAndCompressImage(File file) async {
    log.i('crop and compressed initiated');
    // the inserted image is passed down to the crop method
    final File _croppedFile = await _cropImage(file);

    // insert the resulting cropped image into the compress method
    final File _compressFile = await _compressImage(_croppedFile);
    return _compressFile;
  }

  /// This method allows image selection from device's camera
  Future<File?> selectFromCamera() async {
    log.i('select from camera initiated');
    // in-memory image placeholder
    File? image;

    // returned selected image
    final XFile? file =
    await _imagePicker.pickImage(source: ImageSource.camera);

    // making sure the image gotten isn't null and resizing
    if (file != null) {
      image = await cropAndCompressImage(File(file.path));
    }

    // returning that image for use
    return image;
  }

  /// This method allows image selection from the device's gallery
  Future<XFile?> selectFromGallery() async {
    log.i('select from gallery initiated');
    // in-memory image placeholder
    File? image;

    // returned selected image
    final XFile? file = await _imagePicker.pickImage(source: ImageSource.gallery);
    log.i('Image Selected: ${file?.path}');

    // making sure the image gotten isn't null and resizing
    // if (file != null) {
    //   image = await cropAndCompressImage(File(file.path));
    // }

    // returning that image for use
    return file;
  }
}