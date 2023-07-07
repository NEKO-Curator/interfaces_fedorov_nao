import 'package:image_picker/image_picker.dart';
import 'package:interfaces_fedorov_coursework_nao/common/errors/exceptions.dart';
import 'package:interfaces_fedorov_coursework_nao/data/datasources/image_picker/base_image_picker.dart';

class ImagePickerImpl implements BasePicker {
  @override
  Future<List<int>> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      List<int> bytes = await image.readAsBytes();
      return bytes;
    }
    throw PickerException("Failed to load the image.");
  }
}
