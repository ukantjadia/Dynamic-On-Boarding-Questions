import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'onBoardingDataModel.dart';

// OnBoardingDataModel? onBoardingData;

class getUserData extends GetConnect {

// vscode-fold =3
  Future<OnBoardingDataModel> getOnBoardingData() async {
    String url = "https://mocki.io/v1/907062f0-c008-4597-9f3f-bf11526da23c";
    // String url = "http://10.0.20.110:8000/api/get_onboard";
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
