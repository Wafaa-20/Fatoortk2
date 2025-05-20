import 'package:image_picker/image_picker.dart';

class ImagePickerController {
  final ImagePicker picker = ImagePicker();
  final cameraImage = (ImageSource.camera);
  final galleryImage = (ImageSource.gallery);
  XFile? selectedImage; //selectedImage from camera or gallery

  Future<XFile?> getImage(ImageSource source) async {
    final pickedImage = await picker.pickImage(source: source);
    if (pickedImage != null) {
      selectedImage = pickedImage;
    }
    return selectedImage;
  }
}
