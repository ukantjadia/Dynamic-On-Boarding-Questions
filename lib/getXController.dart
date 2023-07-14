import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:on_boarding_dynamic_que/models/onBoardingDataModel.dart';

import 'models/GetResponse.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class myController extends GetxController with StateMixin<OnBoardingDataModel> {
  RxString selected = "".obs;
  var name1 = "".obs;
  var mobile = "".obs;
  RxInt type = 0.obs;

  // getOnBoardingData () async{
  // }

  getUserData onBoardingData = getUserData();

  List<String> quesTypeList =  <String>['5', '0', '0', '0', '2', '2'];
  // List<String?> mylist ;
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
  Map<String, String>? controllerMap; // = {for (var item in quesTypeList) item: 0};

  // getOnBoardingData data = getOnBoardingData();

  @override
  void onInit() {
    super.onInit();
  String? category_id = state?.onboardCategories?[0].onboardQuestions?[0].locale.toString();
  debugPrint(category_id);
    // RxInt? totalQues = state?.onboardCategories?[0].onboardQuestions?[0]..id;


    controllerMap = {for (var item in quesTypeList) '$item': ''}.obs;
    // Get called when controller is created
    fetchAPI();
  }

  // List questionId = onBoardingData?.onboardCategories..id;
  void fetchAPI() {
    onBoardingData.getOnBoardingData().then(
      (response) {
        change(response, status: RxStatus.success());

        debugPrint(" from fetch api ${response.userDetail?.email}");
      },
      onError: (err) {
        change(null, status: RxStatus.error(err.toString()));
      },
    );
  }
}
