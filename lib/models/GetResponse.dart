import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'onBoardingDataModel.dart';

// OnBoardingDataModel? onBoardingData;

class getUserData extends GetConnect {


  Future<OnBoardingDataModel> getOnBoardingData() async {
    String url = "https://mocki.io/v1/208f88ed-0454-4b8a-9bde-c2501c14d087";
    final response = await get(url);

    if (response.status.hasError) {
      debugPrint("Res code from else ${response.statusCode}");
      return Future.error(response.statusText.toString());
    } else {
      debugPrint("Res code from if ${response.statusCode}");
      // onBoardingData = OnBoardingDataModel.fromJson(jsonDecode(response.body));
      // debugPrint("Res code from if ${response.bodyString.toString()}");
      return OnBoardingDataModel.fromJson(jsonDecode(response.bodyString!));
    }
  }
}
