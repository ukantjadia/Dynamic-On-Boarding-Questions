import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:on_boarding_dynamic_que/allBuilders.dart';

class myDropdown extends StatefulWidget {
  const myDropdown({super.key});

  @override
  State<myDropdown> createState() => myDdropdownState();
}
List<String> myList = <String>['One', 'Two', 'Three', 'Four'];

class myDdropdownState extends State<myDropdown> {
  String dropdownvalue = myList.first;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment : MainAxisAlignment.center,
            children: [
              DropdownButton(
                // value: selected,
                onChanged: (String? value ){
                  setState(() {
                    dropdownvalue = value!;
                  });
                  
                },
                
                
                
                
                
                items: myList.map<DropdownMenuItem<String>>((String value){
                return DropdownMenuItem(child: Text(value),value: value );
              }).toList(),)
        
            ],
          ),
        ),
      ),
    );
  }
}