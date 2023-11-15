import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard(this.col,this.cardChild ,this.WorkTBD,{super.key});
  final Color  col;
  final VoidCallback?  WorkTBD;
  final Widget? cardChild;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: WorkTBD,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: col
        ),
        child: cardChild,
      ),
    );
  }
}