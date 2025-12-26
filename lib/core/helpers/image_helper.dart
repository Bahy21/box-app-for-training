import 'dart:io';
import 'dart:typed_data';

import 'package:box_app/core/di/di.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

enum PickImageFromEnum { camera, gallery }

@injectable
class DocumentHelper {
  static final ImagePicker _imagePicker = getIt<ImagePicker>();
  static File? pickedFile;
  static File? pickedImage;

  Future<File> compressFile({required XFile xFile}) async {
    Uint8List? uint8list = await FlutterImageCompress.compressWithFile(
      xFile.path,
      quality: 90,
      minWidth: 800,
      minHeight: 600,
    );
    final tempDir = await getTemporaryDirectory();
    // final tempDir = await getApplicationDocumentsDirectory();
    final compressedFilePath = join(
      tempDir.path,
      'compressed_${basename(xFile.path)}',
    );
    File compressedFile = File(compressedFilePath);
    await compressedFile.writeAsBytes(uint8list!);

    return compressedFile;
  }

  Future<File?> pickImage({required PickImageFromEnum type}) async {
    late XFile? photo;
    endUploadFile();
    if (type == PickImageFromEnum.camera) {
      photo = await _imagePicker.pickImage(source: ImageSource.camera);
    } else {
      photo = await _imagePicker.pickImage(source: ImageSource.gallery);
    }

    if (photo != null) {
      pickedImage = await compressFile(xFile: photo);
      return pickedImage;
    } else {
      return null;
    }
  }

  void endUploadFile() {
    pickedImage = null;
  }
}
