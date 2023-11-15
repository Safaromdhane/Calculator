import 'package:flutter/material.dart';

import 'Constants.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({Key? key,required this.onPressed,required this.childIcon}) : super(key: key);
  final VoidCallback onPressed;
  final Widget childIcon;
  @override
  Widget build(BuildContext context) {
    return  RawMaterialButton(
      constraints: const BoxConstraints.tightFor(
          width: 50.0,
          height: 50.0
      ),
      elevation: 0.0,
      shape: const CircleBorder(),
      fillColor: kRawIconButtonColor,
      focusColor: kBottomContainerColor,
      onPressed: onPressed,
      child: childIcon,
    );
  }
}