// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:bmi_calculator/Components//ReusableCard.dart';
import 'package:flutter/material.dart';

import '../Components/BottomButton.dart';
import '../Components/Constants.dart';

// ignore: camel_case_types
class Results_page extends StatelessWidget {
  const Results_page({Key? key, this.BMIResult, this.BMINum, this.BMIDesc}) : super(key: key);
  final BMIResult;
  final BMINum;
  final BMIDesc;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("BMI Calculator")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Expanded(
              child: Center(
                child: Text("Your Result",style: kResultTitleStyle),
              ),
          ),
           Expanded(
             flex: 5,
              child: ReusableCard(
                kActiveCardColor,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:  [
                    Center(child: Text("$BMIResult".toUpperCase(),style: kResultTxtStyle)),
                    Center(child: Text("$BMINum",style: kResultNumStyle,)),
                    Center(
                      child: Text(
                        "$BMIDesc",
                        style: kResultDescStyle,
                        textAlign: TextAlign.center,),
                    )
                  ],
                ),
              null)
          ),
           GestureDetector(
             onTap: (){
               Navigator.pop(context);
             },
               child: const BottomButton(
                 ButtonTxt: "RE-CALCULATE",
               )
           )
        ],
      ),
    );
  }
}
