// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_boarding_dynamic_que/allBuilders.dart';

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
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CUSTOM STEPPER',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
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
                  for (int category = 0;
                      category < onBoardingCategories.length;
                      category++) ...[
                    StepperComponent(
                      currentIndex: _currentIndex,
                      index: category,
                      onTap: () {
                        setState(() {
                          _currentIndex = category;
                        });
                        _pageController.jumpToPage(category);
                      },
                    ),
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
                // control.myList = ["values"];
                debugPrint("${control.myList}");
              });
            },
            child: const Text("dfsjdflkjsldfkjs"),
          ),
        ],
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
                              : Text('')),
                    ),
                  ],
                ),
                // //index+1 we dont wanna show 0 in the screen since our index will start at 0
                Text('Page ${index + 1}'),
              ],
            )
          : //Text("sdfjsdlfjsdlfjadfafdalfjaljflakjfdlskjdflasdjflajdf\ndjflsdjflsdf")
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
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
                              : Text('')),
                    ),
                    //this the ligne
                    Container(
                      height: 2,
                      width: 66,
                      //why index+1 we want to turn the ligne orange that precede the active bubble
                      color: currentIndex >= index + 1
                          ? colors.primary
                          : colors.border,
                    ),
                  ],
                ),
                Text('Page ${index + 1}'),
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
