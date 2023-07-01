import 'package:customar_app/util/index_path.dart';

class CamerasController extends GetxController {
  var photo=[].obs;

  Future takePicture() async {
    ImagePicker _picker = ImagePicker();
    XFile firstPic = (await _picker.pickImage(source: ImageSource.camera))!;

    if (firstPic != null) {
      print("taked pic ${firstPic.path}, ${firstPic.name}");
      photo.add(firstPic);
      print("taked pic ${firstPic.path}, ${photo.length}");
    }
    update();
  }

  Future gallery() async {
    ImagePicker _picker = ImagePicker();
    XFile getPic = (await _picker.pickImage(source: ImageSource.gallery))!;

    if (getPic != null) {
      print("get pic ${getPic.path}, ${getPic.name}");
      photo.add(getPic);
      print("get pic ${getPic.path}, ${photo.length}");
    }
    update();
  }
}