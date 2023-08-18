import 'package:get/get.dart';

class ControllerAuth extends GetxController{
  var token = ''.obs, password=''.obs, role ='';
  bool edit = true.obs.canUpdate;
  bool password_result = false.obs.canUpdate;

  tokenadd(String _token){
    token = _token.obs;
  }
}
