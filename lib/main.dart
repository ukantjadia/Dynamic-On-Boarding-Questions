import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:on_boarding_dynamic_que/getXController.dart';
import 'package:on_boarding_dynamic_que/progressBar.dart';

import 'checkingForDropdown.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  myController control = Get.put(myController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      // home: myDropdown(),
      home : CustomStepper()
    );
  }
}
