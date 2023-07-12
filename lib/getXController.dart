import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class myController extends GetxController{
  RxString selected="".obs;
var name1="".obs;
var mobile="".obs;
RxInt type=0.obs;


RxList myList = [1,2,3,0,1].obs;
  // List<String> myList = List<String>.generate(3, (index) => '').obs; // controller 
  List<String> myDropdown = List<String>.generate(9, (index) => '').obs;
  // List<RxInt> allController = List<RxInt>.generate(5, (index) => ).obs;


   List<int> allControlle = List<int>.generate(5, (int index) => index).obs;
  // List<String> myselection = List<String>.generate(3, (index) => '').obs;
Map<int,String> controllerMap = {
  1: "",
  2: "",
  3: "",
  4: "",
  5: "",
  6: "",
  7: "",
  8: "",
  9: "",
}.obs;
// myList

}