import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  // Metodo que carga y devuelve una imagen de la galeria del dispositivo.
  Future<
    XFile?
  >
  loadImageFromGallery() async {
    return await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
  }

  // Metodo que carga y devuelve una imagen desde la camara del dispositivo.
  Future<
    XFile?
  >
  loadImageFromCamera() async {
    return await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
  }
}
