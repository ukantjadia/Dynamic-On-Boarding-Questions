import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class myController extends GetxController {
  RxString selected = "".obs;
  var name1 = "".obs;
  var mobile = "".obs;
  RxInt type = 0.obs;

  List<String> myList = <String>['5', '0', '0', '0', '2', '2'];
  List<String> answer = [
    'have_passport',
    'Pnumber',
    'Pdoe',
    'Udob',
    'nationaliy',
    'city'
  ];
  // RxBool isSelected = true.obs;
  RxInt isSelected = 0.obs;
  RxBool yes = false.obs;
  


  List<int> allControlle = List<int>.generate(6, (int index) => index).obs;
  Map<String, String>? controllerMap; // = {for (var item in myList) item: 0};

  @override
  void onInit() {
    controllerMap = {for (var item in myList) '$item': ''}.obs;

    // Get called when controller is created
    super.onInit();
  }
//   caller(isSelected)
// ,
  // Map<int, String> controllerMap = {
  //   1: "",
  //   2: "",
  //   3: "",
  //   4: "",
  //   5: "",
  //   6: "",
  //   7: "",
  //   8: "",
  //   9: "",
  // }.obs;
void caller(int isSelected){
}

// myList
}
