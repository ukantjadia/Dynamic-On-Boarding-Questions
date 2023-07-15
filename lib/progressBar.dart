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
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final homePage homepage = homePage();

  List<Widget> onBoardingCategories = [
    homePage(),
    first(),
    first(),
    first(),
    first(),
    first(),
    first(),
    first(),
    first(),
  ];
  List<OnboardCategories> questionList1 = [];

  @override
  Widget build(BuildContext context) {
    // final Size size = (TextPainter(
    //         text: TextSpan(
    //             text: control.state?.onboardCategories?[3].categoryName
    //                 .toString(),
    //             style: TextStyle(
    //                 color: colors.primary,
    //                 fontSize: 12,
    //                 fontWeight: FontWeight.w400)),
    //         maxLines: 1,
    //         textScaleFactor: MediaQuery.of(context).size.width,
    //         // MediaQuery.of(context).textScaleFactor,
    //         textDirection: TextDirection.ltr)
    //       ..layout())
    //     .size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CUSTOM STEPPER',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
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
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      // ! first loop 
                      for (int category = 1;
                          category <=
                              //(control.state?.onboardCategories?.length ?? 1);
                          5;
                          category++) ...[
                        StepperComponent(
                          currentIndex: _currentIndex,
                          index: category,
                          isLast: category <= onBoardingCategories.length - 2
                              ? false
                              : true,
                          onTap: () {
                            setState(() {
                              _currentIndex = category;
                            });
                            _pageController.jumpToPage(category);
                          },
                        ),
                      // ! second loop 

                        for (int questions = 1;
                            questions <=5;
                                // (control.state?.onboardCategories?[category].onboardQuestions?.length ?? 1);
                            questions++) ...[
                          if (control.state?.onboardCategories?[category]
                                  .onboardQuestions?[questions].type ==
                              'enter') ...[
                            // yesNoConatainer(questions.toString())
                          ] else if (control.state?.onboardCategories?[category]
                                  .onboardQuestions?[questions].type ==
                              'dropdown') ...[
                            // MultipleSelection()
                          ] else if (control.state?.onboardCategories?[category]
                                  .onboardQuestions?[questions].type ==
                              'switch') ...[
                            EnterForm(questions.toString()),
                            yesNoConatainer(questions.toString())
                          ] else if (control.state?.onboardCategories?[category]
                                  .onboardQuestions?[questions].type ==
                              'multiple') ...[
                            // MultipleSelection()
                          ] else if (control.state?.onboardCategories?[category]
                                  .onboardQuestions?[questions].type ==
                              'date') ...[
                            // MultipleSelection()
                          ] else if (control.state?.onboardCategories?[category]
                                  .onboardQuestions?[questions].type ==
                              'radio') ...[
                            // MultipleSelection()
                          ] else if (control.state?.onboardCategories?[category]
                                  .onboardQuestions?[questions].type ==
                              'slider') ...[
                            // MultipleSelection()
                          ] else ...[
                            Text("not mention ${questions}")
                          ]
                        ]
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
                    children: [onBoardingCategories[_currentIndex]],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _currentIndex += 1;
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
                Text('Pagesdsdfsadf ${index + 1}'),
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
                          padding: EdgeInsets.only(left: 40, right: 50),
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
                  width: 62,
                  height: 30,
                  child: Text(
                      strutStyle: StrutStyle(),
                      textAlign: TextAlign.center,
                      softWrap: true,
                      '${control.state?.onboardCategories?[4].categoryName}',
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
