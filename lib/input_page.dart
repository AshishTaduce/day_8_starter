import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'round button.dart';
import 'results_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender {
  male,
  female,
}

const TextStyle kNumberLabelTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 36,
  fontWeight: FontWeight.bold,
);
const TextStyle kLabelTextStyle = TextStyle(
  color: Color.fromARGB(150, 255, 255, 255),
  fontSize: 28,
  //fontWeight: FontWeight.bold,
);

class _InputPageState extends State<InputPage> {
  Gender gender; // Male = 0, Female = 1
  Color activeCardColor = Color(0xFF1D1F31);
  Color inactiveCardColor = Color(0xFF111328);
  Color activeText = Colors.white;
  Color inactiveText = Colors.white.withAlpha(150);
  double height = 183;
  double weight = 78;
  double age = 28;
  double bmi = 21.2;

  @override
  Widget build(BuildContext context) {
    var textHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 100,
                          color:
                              gender == Gender.male ? activeText : inactiveText,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'MALE',
                          style: TextStyle(
                            fontSize: 24,
                            color: gender == Gender.male
                                ? activeText
                                : inactiveText,
                          ),
                        )
                      ],
                    ),
                    color: gender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    tapCallback: () {
                      setState(() {
                        gender = Gender.male;
                      });
                      print('Male selected');
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 100,
                          color: gender == Gender.female
                              ? activeText
                              : inactiveText,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'FEMALE',
                          style: TextStyle(
                            fontSize: 24,
                            color: gender == Gender.female
                                ? activeText
                                : inactiveText,
                          ),
                        ),
                      ],
                    ),
                    color: gender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    tapCallback: () {
                      setState(() {
                        gender = Gender.female;
                      });

                      print('Female selected');
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Height',
                    textAlign: TextAlign.center,
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        '$height',
                        textAlign: TextAlign.center,
                        style: kNumberLabelTextStyle,
                      ),
                      Text(
                        'cm',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: activeText,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      thumbColor: Colors.pink,
                      overlayColor: Colors.pinkAccent.withAlpha(100),
                      activeTrackColor: activeText,
                      inactiveTrackColor: inactiveText,
                    ),
                    child: Slider(
                        value: height.roundToDouble(),
                        min: 110,
                        max: 210,
                        divisions: 100,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue;
                          });
                        },
                        semanticFormatterCallback: (double newValue) {
                          return '${newValue.round()}';
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: textHeight * 0.02,
                        ),
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          '$weight',
                          style: kNumberLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            RoundButton(
                              icon: Icon(
                                Icons.remove,
                                size: 32,
                              ),
                              callback: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            RoundButton(
                              icon: Icon(
                                Icons.add,
                                size: 32,
                              ),
                              callback: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: textHeight * 0.02,
                        ),
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),

                        Text(
                          '$age',
                          style: kNumberLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            RoundButton(
                              icon: Icon(
                                Icons.remove,
                                size: 32,
                              ),
                              callback: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            RoundButton(
                              icon: Icon(
                                Icons.add,
                                size: 32,
                              ),
                              callback: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            color: Colors.pinkAccent,
            width: double.infinity,
            height: textHeight * 0.08,
            child: FlatButton(
              onPressed: (){
                print('BMI found');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ResultPage('$weight',bmi)));
              },
              child: Text(
                'CALCULATE YOUR BMI',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function tapCallback;

  ReusableCard(
      {this.color = const Color(0xFF1D1F31), this.child, this.tapCallback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapCallback,
      child: Container(
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: child,
      ),
    );
  }
}
