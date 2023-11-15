import 'package:flutter/material.dart';

import 'Constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key, required this.ButtonTxt,
  });
  final ButtonTxt;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBottomContainerColor,
      margin: const EdgeInsets.only(top: 10.0),
      width: double.infinity,
      height: kBottomContainerHeight,
      padding: const EdgeInsets.only(bottom: 20.0),
      child:  Center(child: Text("$ButtonTxt",style: kLargeButtonTxtStyle,)),
    );
  }
}