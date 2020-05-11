import 'package:flutter/material.dart';
import '../constants.dart';

class RoundedIconButton extends StatelessWidget {
  RoundedIconButton({
    @required this.icon,
    @required this.pressOperation,
    this.longPressOperation,
  });

  final IconData icon;
  final Function pressOperation;
  final Function longPressOperation;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: pressOperation,
      onLongPress: longPressOperation,
      child: Icon(icon),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: kRoundIconButtonColor,
      elevation: 8.0,
    );
  }
}
