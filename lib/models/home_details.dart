
import 'package:customar_app/util/image_const.dart';

List<SpareData> spareData = <SpareData>[
  SpareData(
    img: AppImages.BANNER_DEMO1,
  ),
  SpareData(
    img: AppImages.BANNER_DEMO2,
  ),
  SpareData(
    img: AppImages.BANNER_DEMO3,
  ),
];

class SpareData {
  String img;

  SpareData({
    required this.img,
  });
}


List<SpotlistData> spotlistData = <SpotlistData>[
  SpotlistData(
    img: AppImages.SPOTDATAIMG1,
  ),
  SpotlistData(
    img: AppImages.SPOTDATAIMG2,
  ),
  SpotlistData(
    img: AppImages.SPOTDATAIMG3,
  ),
  SpotlistData(
    img: AppImages.SPOTDATAIMG4,
  ),
];

class SpotlistData {
  String img;

  SpotlistData({
    required this.img,
  });
}