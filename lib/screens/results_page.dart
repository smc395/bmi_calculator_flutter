import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({
    @required this.bmi,
    @required this.results,
    @required this.interpret,
  });

  final String bmi;
  final String results;
  final String interpret;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI RESULTS'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.center,
              child: Text(
                'Your Results',
                style: kResultsTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  results.toUpperCase(),
                  style: kResultsTextStyle,
                ),
                Text(
                  bmi,
                  style: kBMITextStyle,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  alignment: Alignment.center,
                  child: Text(
                    interpret,
                    style: kInterpretationTextStyle,
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonText: 'RECALCULATE',
            tapAction: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
