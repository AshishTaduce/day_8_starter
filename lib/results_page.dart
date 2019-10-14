import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  @override
  String name;
  double bmi;

  ResultPage(this.name, this.bmi);

  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    var size = screenWidth * 0.85;

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: screenHeight * 0.04,
          ),
          Text(
            'Your Result',
            style: TextStyle(
              color: Colors.white,
              fontSize: 38,
              fontWeight: FontWeight.bold,
            ),
             textAlign: TextAlign.left,
          ),
          Expanded(
            child: Center(
              child: Container(
                height: screenHeight * 0.63,
                width: screenWidth * 0.85,
                color: Color(0xFF1D1F33),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: screenHeight * 0.04,
                    ),
                    Text (
                        'NORMAL',
                    style: TextStyle(
                      color: Color(0xFF41D38B),
                      fontSize: 16,
                    ),),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text ('$bmi',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 90,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text (
                        'Normal BMI range:',
                        style: TextStyle(
                          color: Colors.white.withAlpha(150),
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text ('18.5 - 25 kg/m2',
                        style: TextStyle(
                          fontSize: 20,
                        ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(48),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: <Widget>[
                          Text ('You have a normal body weight. Good Job!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.4,
                      height: size * 0.15,
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: Color(0xFF191A2E),
                      ),
                      child: FlatButton (
                        onPressed: null,
                        child: Text(
                          'Save Result',
                          style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: Colors.pinkAccent,
            width: double.infinity,
            height: screenHeight * 0.08,
            child: FlatButton(
              onPressed:null,
              child: Text(
                'CALCULATE YOUR BMI',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
