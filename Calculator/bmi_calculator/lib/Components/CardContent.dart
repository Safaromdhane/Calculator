// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';

import 'Constants.dart';

class CardContent extends StatelessWidget {


  const CardContent(this.Ficon,this.txt,{super.key,});
  final String txt;
  final IconData Ficon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Ficon,
          size: kIconSize,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(txt,style: kTxtSty,)
      ],);
  }
}