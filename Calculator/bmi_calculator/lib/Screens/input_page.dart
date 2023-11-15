// ignore_for_file: constant_identifier_names, library_private_types_in_public_api, non_constant_identifier_names


import 'package:bmi_calculator/Screens/Results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Components/BottomButton.dart';
import '../Components/CardContent.dart';
import '../Components/Constants.dart';
import '../Components/ReusableCard.dart';
import '../Components/RoundIconButton.dart';
import 'package:bmi_calculator/CalculatorBrain.dart';

enum Gender{
  Female,
  Male
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? SelectedGender;
  int height = 180;
  int weight = 65;
  int age = 15;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children:   [
              //The male option
              Expanded(
                  child:ReusableCard(
                      SelectedGender == Gender.Male ? kActiveCardColor : kInActiveCardColor,
                      const CardContent(FontAwesomeIcons.mars,"MALE"),
                      (){
                      setState(()
                      {SelectedGender=Gender.Male;
                      });}
                  )
              ),
              //The female option
              Expanded(
                  child: ReusableCard(
                      SelectedGender == Gender.Female ? kActiveCardColor : kInActiveCardColor,
                  const CardContent(FontAwesomeIcons.venus,"FEMALE"),
                          (){
                        setState(()
                        {SelectedGender=Gender.Female;
                        });}
              )
              ),
            ],
          )),
           //The Slider
           Expanded(
               child:  ReusableCard(kActiveCardColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const Text("HEIGHT",style: kTxtSty,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children:  [
                      Text("$height",style: kNumSty),
                      const Text("cm",style: kTxtSty,)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: kActiveSlideColor,
                      inactiveTrackColor: kInActiveSlideColor,
                      thumbColor: kBottomContainerColor,
                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
                      overlayColor: kSlideThumbOverlayColor
                    ),
                    child: Slider(
                    value: height.toDouble(),
                      min: kMinSlide.toDouble(),
                      max: kMaxSlide.toDouble(),
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),null)
           ),
          Expanded(child: Row(
            children:  [
              //The weight
              Expanded(
                  child:  ReusableCard(
                      kActiveCardColor,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          const Text("WEIGHT",style: kTxtSty,),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.baseline,
                             textBaseline: TextBaseline.alphabetic,
                             children: [
                               Text("$weight",style: kNumSty,),
                               const Text("Kg",style: kTxtSty,),
                             ],
                           ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               RoundIconButton(
                                   onPressed: (){
                                     setState(() {
                                       if(weight>15) weight--;
                                     });
                                   },
                                 childIcon: const Icon(FontAwesomeIcons.minus),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                onPressed: (){
                                  setState(() {
                                    if(weight<999) weight++;
                                  });
                                },
                                childIcon: const Icon(FontAwesomeIcons.plus),
                              ),
                            ],
                          )
                        ],
                      ),
                      null)
              ),
              //The age
               Expanded(
                  child:  ReusableCard(
                      kActiveCardColor,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          const Text("AGE",style: kTxtSty,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("$age",style: kNumSty,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                onPressed: (){
                                  setState(() {
                                    if(age>0) age--;
                                  });
                                },
                                childIcon: const Icon(FontAwesomeIcons.minus),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                onPressed: (){
                                  setState(() {
                                    if(age<110) age++;
                                  });
                                },
                                childIcon: const Icon(FontAwesomeIcons.plus),
                              ),
                            ],
                          )
                        ],
                      ),
                      null)
              ),
            ],
          )),
          GestureDetector(
            onTap: (){
              CalculatorBrain calc = CalculatorBrain(height, weight);
              print("weight :$weight");
              print("Height :$height");
              print("BMI : "+calc.calculateBMI());
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>
                    Results_page(
                      BMIResult: calc.getResult(),
                      BMINum: calc.calculateBMI(),
                      BMIDesc: calc.getInter(),
                    )
              ),
              );
            },
            child: const BottomButton(ButtonTxt: "CALCULATE",),
          )
        ],
      )
    );
  }
}






