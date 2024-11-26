import 'package:cheni/routing.dart';
import 'package:cheni/services/Navigation.service.dart';
import 'package:cheni/services/Picture.service.dart';
import 'package:cheni/states/Picture.state.dart';
import 'package:cheni/utils/types.dart';

takePictures() {
  var pictureService = PictureService();
  pictureService.takePictures();
}

viewPictures(List<CustomPath> paths) {
  var navigationService = NavigationService();
  var pictureState = PictureState();

  pictureState.picturePaths = paths;
  navigationService.navigateTo(ScreenEnum.imageViewer);
}

resetPicture() {
  var pictureState = PictureState();
  pictureState.picturePaths = [];
  pictureState.notifyInterface();
}
