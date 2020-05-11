import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    @required this.buttonText,
    @required this.tapAction,
  });

  final String buttonText;
  final Function tapAction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapAction,
      child: Container(
        color: kThumbColor,
        width: double.infinity,
        height: kBottomButtonHeight,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        child: Center(
          child: Text(buttonText, style: kBottomButtonTextStyle),
        ),
      ),
    );
  }
}
