import 'package:flutter/material.dart';
import 'theme/theme.dart';
//? for type normal Enter Form questions
class EnterForm extends StatefulWidget {
  const EnterForm(
      {super.key, required this.labletext, required this.controller});
  final String labletext;
  final TextEditingController controller;

  @override
  State<EnterForm> createState() => _EnterFormState();
  // const EnterForm._(this.labletext,this.controller);
}

class _EnterFormState extends State<EnterForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: widget.controller,
            // initialValue: "${onBoardingData?.userDetail?.email}",
            decoration: InputDecoration(
                labelText: widget.labletext,
                labelStyle: TextStyle(
                    color: colors.palceholder,
                    fontFamily: 'Heebo',
                    fontSize: 16,
                    fontWeight: FontWeight.w400)),
          ),
        ),
      ],
    );
  }
}

class DateEnterForm extends StatefulWidget {
  const DateEnterForm(
      {super.key, required this.labletext, required this.controller});
  final String labletext;
  final TextEditingController controller;

  @override
  State<DateEnterForm> createState() => _DateEnterFormState();
}

class _DateEnterFormState extends State<DateEnterForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
            decoration: InputDecoration(
                labelText:
                    widget.labletext,
                labelStyle: TextStyle(
                    color: colors.palceholder,
                    fontFamily: 'Heebo',
                    fontSize: 16,
                    fontWeight: FontWeight.w400)
                // hintText: //"sdfsdfsdf",
                //     "${locate.state?.onboardCategories?[category].onboardQuestions?[id].placeholder}",
                // fillColor: colors.bg,

                ),
          );
  }
}


//? add alernative

class addAlterNativeNumber extends StatefulWidget {
 const addAlterNativeNumber(
      {super.key, required this.value});
  final String value;
  // final TextEditingController controller;

  @override
  State<addAlterNativeNumber> createState() => _addAlterNativeNumberState();
}

class _addAlterNativeNumberState extends State<addAlterNativeNumber> {
  bool addAlternaet = true;
  @override
  Widget build(BuildContext context) {
    return 
        // EnterForm(labletext: "",controller: _contrller,),
        Row(
          mainAxisAlignment : MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: ( ) {
                setState(() {
                // debugPrint("$widget.index");
                addAlternaet = !addAlternaet ;
                });
              },
              child: Text("Add ALternative $widget.value"),
            )
          ],
        );
        // addAlternaet ? EnterForm(index: nextQue.toString(), category: widget.category) : Text(""),
      // ],
  }
}