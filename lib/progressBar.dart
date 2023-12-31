// ignore: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_boarding_dynamic_que/allBuilders.dart';
import 'package:on_boarding_dynamic_que/models/onBoardingDataModel.dart';

import 'getXController.dart';

class CustomStepper extends StatefulWidget {
  const CustomStepper({Key? key}) : super(key: key);

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

myController control = Get.find<myController>();

class _CustomStepperState extends State<CustomStepper> {
  // int control.mainIndex.value = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: //Obx (() =>
            Text(
          '${control.state?.onboardCategories?[control.mainIndex.value].categoryName}',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      )
      //),
      ,
      body: control.obx(
        (state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //let's add some padding press alt enter
              const SizedBox(
                height: 10,
              ),
              Container(
                // color: Colors.greenAccent,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      // ! first loop
                      for (int category = 0;
                          category <
                              (control.state?.onboardCategories?.length ?? 0);
                          // 5;
                          category++) ...[
                        Obx(
                          () => StepperComponent(
                            currentIndex: control.mainIndex.value,
                            index: category,
                            isLast: category <=
                                    (control.state?.onboardCategories?.length ??
                                        0)
                                ? false
                                : true,
                            onTap: () {
                              setState(() {
                                control.mainIndex.value = category;
                              });
                              _pageController.jumpToPage(category);
                            },
                          ),
                        )
                        // Text(
                        //     "${control.state?.onboardCategories?[category].categoryName}"),
                      ]
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: PageView(
                    //only scroll with bubbles
                    physics: NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    children: [
                      locate.obx(
                        (state) {
                          return SingleChildScrollView(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Text(
                                  //     "asldfjasldjfasldjfasldf   ${control.mainIndex.value}"),
                                  // Text(
                                  //     "${control.state?.onboardCategories?[control.mainIndex.value].categoryName}"),
                                  for (int questions = 0;
                                      questions < //5;
                                          (control
                                                  .state
                                                  ?.onboardCategories?[
                                                      control.mainIndex.value]
                                                  .onboardQuestions!
                                                  .length ??
                                              1);
                                      questions++) ...[
                                    if (control
                                            .state
                                            ?.onboardCategories![
                                                control.mainIndex.value]
                                            .onboardQuestions?[questions]
                                            .type ==
                                        'enter') ...[
                                      EnterForm(
                                          category: control.mainIndex.value,
                                          index: questions.toString())
                                    ] else if (control
                                            .state
                                            ?.onboardCategories?[
                                                control.mainIndex.value]
                                            .onboardQuestions?[questions]
                                            .type ==
                                        'radio') ...[
                                      radioSelection(
                                          category: control.mainIndex.value,
                                          index: questions.toString())
                                    ]else if (control
                                            .state
                                            ?.onboardCategories?[
                                                control.mainIndex.value]
                                            .onboardQuestions?[questions]
                                            .type ==
                                        'date') ...[
                                      dateEnterForm(
                                          category: control.mainIndex.value,
                                          index: questions.toString())
                                    ] else if (control
                                            .state
                                            ?.onboardCategories?[
                                                control.mainIndex.value]
                                            .onboardQuestions?[questions]
                                            .type ==
                                        'switch') ...[
                                      yesNoContainer(
                                          category: control.mainIndex.value,
                                          index: questions.toString())
                                    ] else if (control
                                            .state
                                            ?.onboardCategories?[
                                                control.mainIndex.value]
                                            .onboardQuestions?[questions]
                                            .type ==
                                        'multiple') ...[
                                      Text(
                                          "Will be ready soon of type ${control.state?.onboardCategories?[control.mainIndex.value].onboardQuestions?[questions].type}")
                                    ] else if (control
                                            .state
                                            ?.onboardCategories?[
                                                control.mainIndex.value]
                                            .onboardQuestions?[questions]
                                            .type ==
                                        'date') ...[
                                      dateEnterForm(
                                          category: control.mainIndex.value,
                                          index: questions.toString())
                                      // Text("Will be ready soon of type ${control.state?.onboardCategories?[control.mainIndex.value].onboardQuestions?[questions].type}")
                                      // MultipleSelection()
                                    ] else if (control
                                            .state
                                            ?.onboardCategories?[
                                                control.mainIndex.value]
                                            .onboardQuestions?[questions]
                                            .type ==
                                        'slider') ...[
                                      Text(
                                          "Will be ready soon of type ${control.state?.onboardCategories?[control.mainIndex.value].onboardQuestions?[questions].type}")
                                      // MultipleSelection()
                                    ] else if (control
                                            .state
                                            ?.onboardCategories?[
                                                control.mainIndex.value]
                                            .onboardQuestions?[questions]
                                            .type ==
                                        'dropdown') ...[
                                      dropDownSinleSelect(
                                          category: control.mainIndex.value,
                                          index: questions.toString()),

                                      // Text("Will be ready soon of type ${control.state?.onboardCategories?[control.mainIndex.value].onboardQuestions?[questions].type}")
                                    ] else ...[
                                      Text(
                                          " Type : ${control.state?.onboardCategories?[control.mainIndex.value].onboardQuestions?[questions].type} no not mention ${questions}")
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
                        },
                      ),
                      //! old calling of pages
                      // onBoardingCategories[control.mainIndex.value],
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    control.mainIndex.value += 1;
                    // control.quesTypeList = ["values"];
                    debugPrint("${control.quesTypeList}");
                  });
                },
                child: Text("next"),
              ),
            ],
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class StepperComponent extends StatelessWidget {
  // index describe the position of our bubble
  int index;
  //currentIndex is index that is gonna change on Tap
  int currentIndex;
  //onTap CallBack
  VoidCallback onTap;

  bool isLast;
  StepperComponent({
    super.key,
    required this.currentIndex,
    required this.index,
    required this.onTap,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    //now let's remove the ligne at the end of the row but also we need to remove unnecessary padding thus we need to remove the expanded
    //widget

    return SizedBox(
      child: isLast
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    // Text("from col row in return "),
                    //this is the bubble
                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: currentIndex >= index + 1
                              // index == currentIndex
                              ? colors.primary
                              : colors.bg,
                          border: Border.all(
                              color: currentIndex >= index
                                  ? colors.primary
                                  : colors.border),
                        ),
                        child: currentIndex >= index + 1
                            ? Icon(
                                Icons.check,
                                color: colors.bg,
                              )
                            : Text(''),
                      ),
                    ),
                  ],
                ),
                // //index+1 we dont wanna show 0 in the screen since our index will start at 0
                // Text('Pagesdsdfsadf ${index + 1}'),
              ],
            )
          : //Text("sdfjsdlfjsdlfjadfafdalfjaljflakjfdlskjdflasdjflajdf\ndjflsdjflsdf")
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  // mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //this is the bubble
                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                          // padding: EdgeInsets.only(left: 40, right: 50),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: currentIndex >= index + 1
                                // index == currentIndex
                                ? colors.primary
                                : colors.bg,
                            border: Border.all(
                                color: currentIndex >= index
                                    ? colors.primary
                                    : colors.border),
                          ),
                          child: currentIndex >= index + 1
                              ? Icon(
                                  Icons.check,
                                  color: colors.bg,
                                )
                              : Text('')),
                    ),
                    //this the ligne

                    Container(
                      // width: desierWith,
                      height: 2,
                      width: 70,
                      color: currentIndex >= index + 1
                          ? colors.primary
                          : colors.border,
                    ),
                  ],
                ),
                // Container(

                Container(
                  color: colors.secondaryBg,
                  width: 72,
                  height: 30,
                  child: Text(
                      strutStyle: StrutStyle(),
                      textAlign: TextAlign.center,
                      softWrap: true,
                      '${control.state?.onboardCategories?[index].categoryName}',
                      style: currentIndex >= index
                          ? TextStyle(
                              color: colors.primary,
                              fontSize: 12,
                              fontWeight: FontWeight.w400)
                          : TextStyle(
                              color: colors.subtitle,
                              fontSize: 12,
                              fontWeight: FontWeight.w400)),
                ),
                // ),
              ],
            ),
    );
  }
}

Widget first() {
  return Column(
    children: [
      // Text("the type of Questions ${control.type}"),
      Obx(
        () => Text("${control.controllerMap}"),
      ),
    ],
  );
}
