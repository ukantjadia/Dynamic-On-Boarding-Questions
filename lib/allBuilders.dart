
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_boarding_dynamic_que/getXController.dart';
import 'package:on_boarding_dynamic_que/theme/colors.dart';
import 'package:velocity_x/velocity_x.dart';

import 'models/GetResponse.dart';

// class homePage extends StatefulWidget {
//   homePage({super.key});

//   @override
//   State<homePage> createState() => _homePageState();
// }

myController locate = Get.find<myController>();
List<String> list = <String>[
  'One',
  'Two',
];
bool isSelected = false;

final AppColors colors = AppColors();

// class _homePageState extends State<homePage> {
//   // final List<String> dropdownvalue = List<String>.generate(list.length, (index) => '');
//   // names
//   // locate.type = 0;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: colors.bg,
//         body: locate.obx(
//           (state) {
//             return SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 20, right: 20),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.max,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     // for (int x = 0; x < locate.quesTypeList.length; x++) ...[
//                     //   if (locate.state?.onboardCategories?[x].onboardQuestions == '5') ...[
//                     //     // MultipleSelection()
//                     //     // EnterForm(x.toString())
//                     //     yesNoConatainer(x.toString())
//                     //   ] else if (locate.quesTypeList[x] == '1') ...[
//                     //     // MultipleSelection()
//                     //   ] else if (locate.quesTypeList[x] == '2') ...[
//                     //     // EnterForm(x.toString()),
//                     //     yesNoConatainer(x.toString())
//                     //   ] else ...[
//                     //     Text("not mention ${x}")
//                     //   ]
//                     // ],
//                     ElevatedButton(
//                         onPressed: () {
//                           // Navigator.push(
//                           //   context,
//                           //   MaterialPageRoute(
//                           //     builder: (context) => test(),
//                           //   ),
//                           // );
//                           debugPrint("   ${locate.quesTypeList}");
//                         },
//                         child: Text("to send data")),
//                     Text("${locate.state?.cities?[0].name}")
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//       // ),
//     );
//   }
// }

//? for type Additional add alter Enter Form questions
class addAlterEnterForm extends StatefulWidget {
  const addAlterEnterForm(
      {super.key, required this.index, required this.category});
  final String index;
  final int category;

  @override
  State<addAlterEnterForm> createState() => _addAlterEnterFormState();
  const addAlterEnterForm._(this.index, this.category);
}

class _addAlterEnterFormState extends State<addAlterEnterForm> {
    bool addAlternaet = true;
    
      // Object get ture => null;
  @override
  Widget build(BuildContext context) {
      int nextQue = int.parse(widget.index)+1;
      
    return Column(
      children: [
        EnterForm(category: widget.category, index: widget.index),
        Row(
          mainAxisAlignment : MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: ( ) {
                setState(() {
                debugPrint("$widget.index");
                addAlternaet = !addAlternaet ;
                debugPrint("net woe $nextQue");
                });
              },
              child: Text("Add ALternative number"),
            )
          ],
        ),
        addAlternaet ? EnterForm(index: nextQue.toString(), category: widget.category) : Text(""),
      ],
    );
  }
}

//? for type normal Enter Form questions
class EnterForm extends StatefulWidget {
  const EnterForm({super.key, required this.index, required this.category});
  final String index;
  final int category;

  @override
  State<EnterForm> createState() => _EnterFormState();
  const EnterForm._(this.index, this.category);
}

class _EnterFormState extends State<EnterForm> {
  @override
  Widget build(BuildContext context) {
    int indexInt = int.parse(widget.index);
    int? id = int.parse(widget.index);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            // initialValue: "${onBoardingData?.userDetail?.email}",
            decoration: InputDecoration(

                labelText:
                    "${locate.state?.onboardCategories?[widget.category].onboardQuestions?[id].questionName}",
                labelStyle: TextStyle(
                    color: colors.palceholder,
                    fontFamily: 'Heebo',
                    fontSize: 16,
                    fontWeight: FontWeight.w400)
                // hintText: //"sdfsdfsdf",
                //     "${locate.state?.onboardCategories?[category].onboardQuestions?[id].questionName}",
                // fillColor: colors.bg,
                ),
            onChanged: (value) {
              locate.name1 = value.obs;
              locate.controllerMap?[widget.index] = value;
              debugPrint("${locate.controllerMap}");
            },
          ),
        ),
      ],
    );
  }
}

//? for type dropdown questions
class dropDownSinleSelect extends StatefulWidget {
  const dropDownSinleSelect(
      {super.key, required this.index, required this.category});
  final String index;
  final int category;
  @override
  State<dropDownSinleSelect> createState() => _dropDownSinleSelectState();
  const dropDownSinleSelect._(this.index, this.category);
}

class _dropDownSinleSelectState extends State<dropDownSinleSelect> {
  @override
  Widget build(BuildContext context) {
    locate.selected = list[0].obs;
    int? id = int.parse(widget.index);
    return Container(
      width: MediaQuery.of(context).size.width - 55,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: DropdownButtonFormField<String>(
              focusColor: colors.primary,
              decoration: InputDecoration(
                  labelText:
                      "${locate.state?.onboardCategories?[widget.category].onboardQuestions?[id].questionName}",
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: colors.border,width: 2),
                  ),
                  labelStyle: TextStyle(color: colors.palceholder)),
              isExpanded: true,
              // value: selected2,
              items: list.map<DropdownMenuItem<String>>(
                (String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyle(
                        color: colors.palceholder,
                        fontFamily: 'Hebbo',
                      ),
                    ),
                  );
                },
              ).toList(),

              //  : Text(
              //     "${locate.state?.onboardCategories?[widget.category].onboardQuestions?[id].placeholder}"),
              onChanged: (value) {
                // setState(() {
                // debugPrint("${selected}");
                locate.controllerMap?[widget.index] = value!;
                // });
                // locate.selected = value.obs;
                // locate.myDropdown[index] = value!;
                debugPrint("${locate.controllerMap}");
              },
            ),
          ),
        ],
      ),
    );
  }
}

//? for type single Radio Selection questions
class radioSelection extends StatefulWidget {
  const radioSelection(
      {super.key, required this.index, required this.category});

  final String index;
  final int category;
  @override
  State<radioSelection> createState() => _radioSelectionState();
  const radioSelection._(this.index, this.category);
}

class _radioSelectionState extends State<radioSelection> {
  @override
  Widget build(BuildContext context) {
    int? id = int.parse(widget.index);
    int? item_count = 5 ?? 0;
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
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: item_count >= 3 ? 3 : 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 17,
                childAspectRatio: 3.05),
            shrinkWrap: true,
            itemCount: item_count,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    locate.isSelected.value = index;
                    debugPrint(' ${locate.isSelected}');
                  });
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
                      "${locate.state?.onboardCategories![widget.category].onboardQuestions?[id].options}",
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
              //   },
              // );
            },
          )
        ],
      ),
    );
  }
}

//? for type yes no tab bar questions
class yesNoContainer extends StatefulWidget {
  const yesNoContainer(
      {super.key, required this.index, required this.category});

  final String index;
  final int category;

  @override
  State<yesNoContainer> createState() => _yesNoContainerState();
  const yesNoContainer._(this.index, this.category);
}

class _yesNoContainerState extends State<yesNoContainer> {
  bool yes = false;
  @override
  Widget build(BuildContext context) {
    int? id = int.parse(widget.index);
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: colors.secondaryBg,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${locate.state?.onboardCategories?[widget.category].onboardQuestions?[id].questionName}",
                style: TextStyle(color: colors.title, fontSize: 16),
              ),
              Container(
                padding: EdgeInsets.only(top: 0, bottom: 0, right: 5, left: 5),
                height: 34,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: colors.primary,
                  borderRadius: BorderRadius.circular(70),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 50,
                      height: 24,
                      decoration: yes
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
                              ],
                            ),
                      alignment: Alignment.center,
                      child: Text(
                        'Yes',
                        style: TextStyle(
                            color: yes ? colors.bg : colors.primary,
                            fontSize: 16),
                      ),
                    ).onTap(
                      () {
                        setState(
                          () {
                            yes = false;
                          },
                        );
                      },
                    ),
                    Container(
                      width: 50,
                      height: 24,
                      decoration: yes
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
                            color: yes ? colors.primary : colors.bg,
                            fontSize: 16),
                      ),
                    ).onTap(
                      () {
                        setState(() {
                          yes = true;
                        });
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
          Column(
            children: [
              if (yes == false) ...[
                EnterForm(category: widget.category, index: widget.index),
              ] else ...[
                Container(),
              ]
            ],
          )
        ],
      ),
    );
  }
}

//? for type to enter date dd/mm/yyyy questions
class dateEnterForm extends StatefulWidget {
  const dateEnterForm({super.key, required this.index, required this.category});

  final String index;
  final int category;
  @override
  State<dateEnterForm> createState() => _dateEnterFormState();
  const dateEnterForm._(this.index, this.category);
}

class _dateEnterFormState extends State<dateEnterForm> {
  @override
  Widget build(BuildContext context) {
    int indexInt = int.parse(widget.index);
    int? id = int.parse(widget.index);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            // initialValue: "${onBoardingData?.userDetail?.email}",
            decoration: InputDecoration(
              labelText:
                  "${locate.state?.onboardCategories?[widget.category].onboardQuestions?[id].questionName}",
              labelStyle: TextStyle(
                    color: colors.palceholder,
                    fontFamily: 'Heebo',
                    fontSize: 16,
                    fontWeight: FontWeight.w400)
              // hintText: //"sdfsdfsdf",
              //     "${locate.state?.onboardCategories?[category].onboardQuestions?[id].placeholder}",
              // fillColor: colors.bg,
              
            ),
            onChanged: (value) {
              locate.name1 = value.obs;
              locate.controllerMap?[widget.index] = value;
              debugPrint("${locate.controllerMap}");
            },
          ),
        ),
      ],
    );
  }
}
