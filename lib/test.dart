// import 'package:carousel_slider/carousel_controller.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:mysip/Home_Module/controller/homeScreen_controller.dart';
// import 'package:mysip/services/api_client.dart';
// import 'package:mysip/Profile_Module/model/clientData_Model.dart';
// import 'package:mysip/Profile_Module/provider/clientData_provider.dart';
// import 'package:mysip/common/packages.dart';
// import 'package:mysip/services/analytics_service.dart';

// final _homeScreenController = Get.put(HomeScreenController());
// final prefs = GetStorage();


// class ProfileController extends GetxController
//     with StateMixin<ClientDataModel>, GetTickerProviderStateMixin{

//   final prefs = GetStorage();

//   RxBool isStatusAvailable = false.obs;
//   RxBool addNewInvestor = false.obs;
//   RxInt bankId = 0.obs;
//   RxBool isNew = false.obs;

//   bool isFirst = true;
//   RxInt activeIndex = 0.obs;

//   final slider = CarouselController();
//   RxInt onPage = 0.obs;


//   getClientData() async {
//     NewClient client = NewClient();
//     ClientDataProvider provider = ClientDataProvider(client: client.init());
//     try {
//       debugPrint("^^^^^^getClientData controller start^^^^^^");

//       change(value, status: RxStatus.loading());
//       await provider.clientDataAPI().then((value) {
//         change(value, status: RxStatus.success());


//         if(value != null){
//           final analyticsService = AnalyticsService();
//           final ClientDataModel data = value;
//           analyticsService.setUpUserProperties(id: data.personal.email);


//           if (data.slider != null) {
//             _homeScreenController.homeSliderItem?.addAll(data.slider ?? []);
//             _homeScreenController.state?.slider.addAll(data.slider!);
//             _homeScreenController.update();
//           }

//           prefs.write("investStatus", data.personal.investStatus);
//         }



//         debugPrint("^^^^^^getClientData controller ended successfully^^^^^^");
//       }, onError: (err) {
//         change(null, status: RxStatus.error(err.toString()));
//         debugPrint(
//             "^^^^^^getClientData controller ended with error $err^^^^^^");
//       });
//     } catch (e, stackTrace) {
//       debugPrint("Error occurred at line");
//       debugPrint(
//           'Error in file ${stackTrace.toString().split('#')[1].split(':')[0]}, line ${stackTrace.toString().split('#')[1].split(':')[1]}');
//     }
//   }

//   changeStateToLoading(){
//     change(null, status: RxStatus.loading());
//   }

//   String toTitleCase(String str) {
//    try{
//      if (str == 'null' || str.isEmpty) {
//        return str;
//      }
//      final words = str.toLowerCase().split(' ');
//      final titleCaseWords = words.map((word) {
//        final firstLetter = word[0].toUpperCase();
//        final rest = word.substring(1);
//        return '$firstLetter$rest';
//      });
//      return titleCaseWords.join(' ');
//    }catch(e){

//      return str;
//    }
//   }
// }
