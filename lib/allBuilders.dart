import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_boarding_dynamic_que/getXController.dart';
import 'package:on_boarding_dynamic_que/theme/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class homePage extends StatefulWidget {
  homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

myController locate = Get.find<myController>();
List<String> list = <String>[
  'One',
  'Two',
  'Three',
  'Four',
];
List<int> list1 = <int>[1, 2, 3, 4, 5];
List<String> dropdownvalue = <String>[
  'One',
  'Two',
  'Three',
  'Four',
  'One',
  'Two',
  'Three',
  'Four',
  'One',
];
List<String> dropdownvalue2 = <String>[
  'One',
  'Two',
];
String selected = list[0];
// String dropdownvalue = list.first;
final AppColors colors = AppColors();

class _homePageState extends State<homePage> {
  // final List<String> dropdownvalue = List<String>.generate(list.length, (index) => '');
  // names
  // locate.type = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colors.bg,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            // verticalDirection: VerticalDirection.up,

            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("data"),
              for (int x = 0; x < 4; x++) ...[
                // Container(child: Text("${locate.myList[x]}")),
                if (list1[x] == 0) ...[
                  EnterForm(x)
                ] else if (list1[x] == 1) ...[
                  DropdownSingleSelection(x)
                  // MultipleSelection()
                ] else if (list1[x] == 2) ...[
                  EnterForm(x),
                  DropdownSingleSelection(x)

                  // MultipleSelection()
                ] else ...[
                  // MultipleSelection()
                  DropdownSingleSelection(x)

                  // continue,
                ]
              ],
              // if (locate.type == 0) ...[
              //   EnterForm(),
              // ] else if (locate.type == 1) ...[
              //   DropdownSingleSelection()
              // ] else if (locate.type == 2) ...[
              //   MultipleSelection()
              // ],
              ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => test(),
                    //   ),
                    // );
                    debugPrint("   ${locate.myList}");
                    // setState((
                    // ) {
                    //   locate.name1 = names[0].obs;
                    //   print(locate.name1);
                    // });
                  },
                  child: Text("to send data")),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}

Widget EnterForm(int index) {
  ///
  /// for question type :--> enter form question
  ///
  // return ListView.builder(
  //   shrinkWrap: true,
  //   itemCount: locate.myList.length,
  //   itemBuilder: (BuildContext context, int index) {
  // _controllers.add(new TextEditingController());
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: "Enter your name",
            fillColor: colors.bg,
          ),
          onChanged: (value) {
            locate.name1 = value.obs;
            locate.controllerMap[index] = value;
            debugPrint("${locate.controllerMap}");
          },
        ),
      ),
    ],
  );
}
// );
// }

Widget DropdownSingleSelection(int index) {
  ///
  /// for question type :--> dropdown selection selection
  ///
  // return ListView.builder(
  //   shrinkWrap: true,
  //   itemCount: locate.myList.length,
  //   itemBuilder: (BuildContext context, int index) {
  // _controllers.add(new TextEditingController());
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton<String>(
          value: locate.controllerMap[index],
          items: list.map<DropdownMenuItem<String>>(
            (String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(
                    color: colors.title,
                    fontFamily: 'Hebbo',
                  ),
                ),
              );
            },
          ).toList(),
          onChanged: (String? value) {
            // setState(() {

            // debugPrint("${selected}");

            locate.controllerMap[index] = value!;
            // });
            // selected = locate.controllerMap[index].toString();
            // locate.myDropdown[index] = value!;
            debugPrint("${locate.controllerMap}");
            // selected = value;
            // debugPrint("$dropdownvalue");
          },
        ),
      ),
      Obx(() => Text(
        " index from lis builder ${locate.controllerMap[index]}",
        style: TextStyle(
          color: colors.title,
        ),
      ),)
      
    ],
  );
}
//   );
// }

Widget MultipleSelection() {
  ///
  /// for question type :--> Multiple selection question
  ///
  // return ListView.builder(
  //   shrinkWrap: true,
  //   // itemCount: locate.myList.length,
  //   itemCount: 1,
  //   itemBuilder: (BuildContext context, int index) {
  // _controllers.add(new TextEditingController());
  return Container(
    padding: EdgeInsets.all(10),
    // color: Color.fromARGB(255, 127, 170, 212),
    width: 353,
    decoration: BoxDecoration(
        color: colors.secondaryBg, border: Border.all(color: colors.border)),
    // height: 242,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Text(
            "Which intake session are you planning to go in?",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: colors.title,
            ),
          ),
        ),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: dropdownvalue.length >= 3 ? 3 : 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 17,
              childAspectRatio: 3.59),
          shrinkWrap: true,
          itemCount: dropdownvalue.length,
          itemBuilder: (context, index) {
            return Container(
              height: 34,
              width: 90,
              color: colors.bg,
              child: Text("ssdfsdf"),
            );
          },
        )
      ],
    ),
  );
}
//   );
// }
