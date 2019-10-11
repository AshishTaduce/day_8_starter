import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender {
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  Gender gender; // Male = 0, Female = 1
  Color activeCardColor = Color(0xFF1D1F31);
  Color inactiveCardColor = Color(0xFF111328);
  Color activeText = Colors.white;
  Color inactiveText = Colors.white.withAlpha(150);
  double height = 183;

  @override
  Widget build(BuildContext context) {
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
                          color: gender == Gender.male ? activeText : inactiveText,
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
                          color: gender == Gender.female ? activeText : inactiveText,
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
                    style: TextStyle(
                      color: inactiveText,
                      fontSize: 28,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        '$height',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: activeText,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
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
                   data: SliderThemeData(thumbColor: Colors.pink,
                       
                       overlayColor: Colors.pinkAccent ),
                    child: Slider(

                        value: height.toDouble(),
                        min: 110,
                        max: 210,
                        divisions: 80,
                        activeColor: activeText,
                        inactiveColor: inactiveText,
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
                  child: ReusableCard(),
                ),
                Expanded(
                  child: ReusableCard(),
                )
              ],
            ),
          ),
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
