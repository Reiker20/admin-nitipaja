import 'package:get/get.dart';

class SettingsController extends GetxController{

  var pressedBool = true;

  changeStatus(isMale) {
    isMale?
        pressedBool =true:
        pressedBool =false;
  }
}