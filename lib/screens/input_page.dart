import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../screens/results_page.dart';
import '../components/reusable_card.dart';
import '../components/reusable_icon.dart';
import '../constants.dart';
import '../components/rounded_icon_button.dart';
import '../components/bottom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int selectedHeight = 60;
  int selectedWeight = 100;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'BMI CALCULATOR',
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedHeight = 60;
                  selectedWeight = 100;
                  age = 25;
                  selectedGender = null;
                });
              },
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    'RESET',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                color: kRoundIconButtonColor,
              ),
            )
          ],
        ),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardColor: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: ReusableIcon(
                      icon: FontAwesomeIcons.male,
                      label: 'MALE',
                    ),
                    gestureAction: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      cardColor: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: ReusableIcon(
                        icon: FontAwesomeIcons.female,
                        label: 'FEMALE',
                      ),
                      gestureAction: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      }),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardColor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        selectedHeight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        ' inches',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: kThumbColor,
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                    ),
                    child: Slider(
                      value: selectedHeight.toDouble(),
                      min: 48.0,
                      max: 96.0,
                      onChanged: (double newValue) {
                        setState(() {
                          selectedHeight = newValue.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              selectedWeight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              ' lbs',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              pressOperation: () {
                                setState(() {
                                  selectedWeight > 1
                                      ? selectedWeight--
                                      : selectedWeight = 0;
                                });
                              },
                              longPressOperation: () {
                                setState(() {
                                  selectedWeight > 9
                                      ? selectedWeight -= 10
                                      : selectedWeight = 0;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              pressOperation: () {
                                setState(() {
                                  selectedWeight++;
                                });
                              },
                              longPressOperation: () {
                                setState(() {
                                  selectedWeight += 10;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              pressOperation: () {
                                setState(() {
                                  age > 1 ? age-- : age = 0;
                                });
                              },
                              longPressOperation: () {
                                setState(() {
                                  age > 9 ? age -= 10 : age = 0;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              pressOperation: () {
                                setState(() {
                                  age++;
                                });
                              },
                              longPressOperation: () {
                                setState(() {
                                  age += 10;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonText: 'CALCULATE BMI',
            tapAction: () {
              CalculatorBrain brain = CalculatorBrain(
                height: selectedHeight,
                weight: selectedWeight,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmi: brain.calculateBMI(),
                    results: brain.getResults(),
                    interpret: brain.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
