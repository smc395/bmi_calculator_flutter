import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard(
      {@required this.cardColor, this.cardChild, this.gestureAction});

  final Color cardColor;
  final Widget cardChild;
  final Function gestureAction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gestureAction,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
