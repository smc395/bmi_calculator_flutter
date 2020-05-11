import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/screens/input_page.dart';

enum Units { imperial, metric }

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  Units selectedUnit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Text(
                'This is a Body Mass Index (BMI) Calculator. It is intended to be used as an indicator of body fat. Please consult your doctor for medical advice.',
                style: kIntroParagraphTextStyle,
              ),
              padding: EdgeInsets.all(15.0),
            ),
            Container(
              child: Text(
                'Choose your units:',
                style: kIntroParagraphTextStyle,
              ),
              padding: EdgeInsets.all(15.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardColor: selectedUnit == Units.imperial
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Imperial',
                        style: kLabelTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    gestureAction: () {
                      setState(() {
                        selectedUnit = Units.imperial;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: selectedUnit == Units.metric
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Metric',
                        style: kLabelTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    gestureAction: () {
                      setState(() {
                        selectedUnit = Units.metric;
                      });
                    },
                  ),
                ),
              ],
            ),
            BottomButton(
              buttonText: 'To Calculator'.toUpperCase(),
              tapAction: selectedUnit == null
                  ? () {}
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InputPage(
                            selectedUnit: selectedUnit,
                          ),
                        ),
                      );
                    },
            )
          ],
        ),
      ),
    );
  }
}
