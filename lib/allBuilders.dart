import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_boarding_dynamic_que/getXController.dart';
import 'package:on_boarding_dynamic_que/theme/colors.dart';
import 'package:velocity_x/velocity_x.dart';

import 'models/GetResponse.dart';

class homePage extends StatefulWidget {
  homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

myController locate = Get.find<myController>();
List<String> list = <String>[
  'One',
  'Two',
];
bool isSelected = false;

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
          body: locate.obx((state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (int x = 0; x < locate.quesTypeList.length; x++) ...[
                      if (locate.quesTypeList[x] == '5') ...[
                        // MultipleSelection()
                        // EnterForm(x.toString())
                        yesNoConatainer(x.toString())
                      ] else if (locate.quesTypeList[x] == '1') ...[
                        // MultipleSelection()
                      ] else if (locate.quesTypeList[x] == '2') ...[
                        // EnterForm(x.toString()),
                        yesNoConatainer(x.toString())
                      ] else ...[
                        Text("not mention ${x}")
                      ]
                    ],
                    ElevatedButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => test(),
                          //   ),
                          // );
                          debugPrint("   ${locate.quesTypeList}");
                        },
                        child: Text("to send data")),
                    Text("${locate.state?.cities?[0].name}")
                  ],
                ),
              ),
            );
          })),
      // ),
    );
  }
}

Widget EnterForm(String index) {
  ///
  /// for question type :--> enter form question
  ///
  // locate.category_id = Cities() as List;

  ///
  int indexInt = int.parse(index);
  String? ukant = locate.state?.cities?[int.parse(index)].name.toString();
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          // initialValue: "${onBoardingData?.userDetail?.email}",
          decoration: InputDecoration(
            hintText://"sdfsdfsdf",
                "${locate.state?.onboardCategories?[0].categoryName}",
            fillColor: colors.bg,
          ),
          onChanged: (value) {
            locate.name1 = value.obs;
            locate.controllerMap?[index] = value;
            debugPrint("${locate.controllerMap}");
          },
        ),
      ),
    ],
  );
}

Widget DropdownSingleSelection(String index) {
  locate.selected = list[0].obs;

  ///Loca
  /// for question type :--> dropdown selection selection
  ///
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton<String>(
          value: locate.selected.toString(),
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
          onChanged: (value) {
            // setState(() {
            // debugPrint("${selected}");
            locate.controllerMap?[index] = value!;
            // });
            // locate.selected = value.obs;
            // locate.myDropdown[index] = value!;
            debugPrint("${locate.controllerMap}");
          },
        ),
      ),
      Obx(
        () => Text(
          " index from lis builder ${locate.controllerMap?[index]}",
          style: TextStyle(
            color: colors.title,
          ),
        ),
      )
    ],
  );
}

Widget MultipleSelection() {
  ///
  /// for question type :--> Multiple selection question
  ///
  return Container(
    padding: EdgeInsets.all(10),
    width: double.infinity,
    decoration: BoxDecoration(
      color: colors.bg,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Text(
            "dfdfdfsdfsdfadfd",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: colors.title,
            ),
          ),
        ),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: list.length >= 3 ? 3 : 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 17,
              childAspectRatio: 3.05),
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Obx(
              () {
                return GestureDetector(
                  onTap: () {
                    locate.isSelected.value = index;
                    debugPrint(' ${locate.isSelected}');
                  },
                  child: Container(
                    height: 34,
                    width: 90,
                    decoration: BoxDecoration(
                      color: locate.isSelected == index
                          ? colors.bg
                          : colors.secondaryBg,
                      boxShadow: locate.isSelected == index
                          ? <BoxShadow>[
                              const BoxShadow(
                                  color: Color.fromARGB(19, 8, 0, 0),
                                  blurRadius: 6.0,
                                  offset: Offset(0.0, 0.0))
                            ]
                          : <BoxShadow>[
                              const BoxShadow(
                                  color: Color.fromARGB(0, 243, 242, 242),
                                  blurRadius: 0.0,
                                  offset: Offset(0.0, 0.0))
                            ],
                    ),
                    child: Center(
                      child: //Text(" ${locate.isSelected.value}")
                          Text(
                        "Male",
                        style: locate.isSelected == index
                            ? TextStyle(
                                fontSize: 16,
                                color: colors.primary,
                                fontWeight: FontWeight.w400)
                            : TextStyle(
                                fontSize: 16,
                                color: colors.subtitle,
                                fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        )
      ],
    ),
  );
}

Widget yesNoConatainer(String index) {
  // bool yes = true;
  return Container(
    padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
    width: double.infinity,
    // height: 64,
    decoration: BoxDecoration(
      color: colors.secondaryBg,
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("sdsfsdfsdf",
              // "${locate.state?.onboardCategories?[5].onboardQuestions?[5].placeholder}",
              style: TextStyle(color: colors.title, fontSize: 16),
            ),
            Container(
              padding: EdgeInsets.only(top: 0, bottom: 0, right: 5, left: 5),
              // width: wi,
              height: 34,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: colors.primary,
                borderRadius: BorderRadius.circular(70),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ///* this is a yes container
                  Obx(
                    () => Container(
                      // padding: EdgeInsets.only(top: 5, bottom: 5, right: 5),
                      width: 50,
                      height: 24,
                      decoration: locate.yes.value
                          ? BoxDecoration(
                              color: colors.primary,
                              borderRadius: BorderRadius.circular(40),
                            )
                          : BoxDecoration(
                              color: colors.bg,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: const <BoxShadow>[
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.14),
                                      blurRadius: 6.0,
                                      offset: Offset(0.0, 0.0))
                                ]),
                      alignment: Alignment.center,
                      child: Text(
                        'Yes',
                        style: TextStyle(
                            color:
                                locate.yes.value ? colors.bg : colors.primary,
                            fontSize: 16),
                      ),
                    ).onTap(() {
                      //     setState(() {
                      // });
                      locate.yes.value = false;
                      debugPrint(" from first cntaienr ${locate.yes.value}");
                    }),
                  ),

                  /// * this is a no container
                  Obx(
                    () => Container(
                      // padding: EdgeInsets.only(top: 5, bottom: 5, right: 5),
                      width: 50,
                      height: 24,
                      decoration: locate.yes.value
                          ? BoxDecoration(
                              color: colors.bg,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: const <BoxShadow>[
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.14),
                                      blurRadius: 6.0,
                                      offset: Offset(0.0, 0.0))
                                ])
                          : BoxDecoration(
                              color: colors.primary,
                              borderRadius: BorderRadius.circular(40),
                            ),
                      alignment: Alignment.center,
                      child: Text(
                        'No',
                        style: TextStyle(
                            color:
                                locate.yes.value ? colors.primary : colors.bg,
                            fontSize: 16),
                      ),
                    ).onTap(
                      () {
                        locate.yes.value = true;
                        debugPrint(" from second cntaienr ${locate.yes.value}");
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),

        Obx(() => Column(
              children: [
                if (locate.yes.value == false) ...[
                  EnterForm(index),
                ] else ...[
                  Container(),
                ]
              ],
            ))

        // locate.yes.value ?  : ,
      ],
    ),
  );
}
