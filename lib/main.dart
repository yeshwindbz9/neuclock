import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

import 'about_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool darkMode = false;
  bool analog = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'NEUCLOCK',
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                fontFeatures:[FontFeature.enable('smcp')],
                color: darkMode ? Colors.white : Colors.grey[500],
                letterSpacing: .5,
                fontSize: 30,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      backgroundColor: darkMode ? Colors.grey[850] : Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: darkMode ? Colors.grey[850] : Colors.grey[300],
                  boxShadow: [
                    BoxShadow(
                        color: darkMode ? Colors.black54 : Colors.grey[500],
                        offset: Offset(4.0, 4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0),
                    BoxShadow(
                        color: darkMode ? Colors.grey[800] : Colors.white,
                        offset: Offset(-4.0, -4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0),
                  ]),
              child: analog
                  ? Hero(
                tag: 'clock',
                child: AnalogClock(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle
                  ),
                  width: 150.0,
                  isLive: true,
                  hourHandColor: darkMode ? Colors.white : Colors.black,
                  minuteHandColor: darkMode ? Colors.white : Colors.black,
                  showSecondHand: false,
                  secondHandColor: darkMode ? Colors.white : Colors.black,
                  numberColor: darkMode ? Colors.white : Colors.black87,
                  showNumbers: true,
                  textScaleFactor: 1.4,
                  showTicks: true,
                  showDigitalClock: false,
                  digitalClockColor:
                  darkMode ? Colors.white : Colors.black87,
                  datetime: DateTime.now(),
                ),
              )
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'clock',
                    child: DigitalClock(
                      digitAnimationStyle: Curves.elasticOut,
                      is24HourTimeFormat: false,
                      areaDecoration:
                      BoxDecoration(color: Colors.transparent),
                      hourMinuteDigitDecoration:
                      BoxDecoration(color: Colors.transparent),
                      secondDigitDecoration:
                      BoxDecoration(color: Colors.transparent),
                      hourMinuteDigitTextStyle: TextStyle(
                        color: darkMode ? Colors.white : Colors.black87,
                        fontSize: 50,
                      ),
                      amPmDigitTextStyle: TextStyle(
                          color: darkMode ? Colors.white : Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                NeumorphicRadio(
                  style: NeumorphicRadioStyle(
                    shape: NeumorphicShape.convex,
                    boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(100)),
                    lightSource: LightSource.topLeft,
                    selectedColor:
                    darkMode ? Colors.grey[850] : Colors.grey[300],
                    unselectedColor:
                    darkMode ? Colors.grey[850] : Colors.grey[300],
                  ),
                  padding: EdgeInsets.all(10),
                  child: analog
                      ? Icon(
                    Icons.timelapse_rounded,
                    size: 40,
                    color: darkMode ? Colors.white : Colors.black87,
                  )
                      : Icon(
                    Icons.schedule_outlined,
                    size: 40,
                    color: darkMode ? Colors.white : Colors.black87,
                  ),
                  onChanged: (value) {
                    setState(() {
                      analog = analog ? false : true;
                    });
                  },
                ),
                SizedBox(
                  width: 30,
                ),
                NeumorphicRadio(
                  style: NeumorphicRadioStyle(
                    shape: NeumorphicShape.convex,
                    boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(100)),
                    lightSource: LightSource.topLeft,
                    selectedColor:
                    darkMode ? Colors.grey[850] : Colors.grey[300],
                    unselectedColor:
                    darkMode ? Colors.grey[850] : Colors.grey[300],
                  ),
                  padding: EdgeInsets.all(10),
                  child: darkMode
                      ? Icon(
                    Icons.wb_sunny_outlined,
                    color: Colors.white,
                    size: 40,
                  )
                      : Icon(Icons.wb_sunny, size: 40),
                  onChanged: (value) {
                    setState(() {
                      darkMode = darkMode ? false : true;
                    });
                  },
                ),
                SizedBox(
                  width: 30,
                ),
                NeumorphicRadio(
                  style: NeumorphicRadioStyle(
                    shape: NeumorphicShape.convex,
                    boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(100)),
                    lightSource: LightSource.topLeft,
                    selectedColor:
                    darkMode ? Colors.grey[850] : Colors.grey[300],
                    unselectedColor:
                    darkMode ? Colors.grey[850] : Colors.grey[300],
                  ),
                  padding: EdgeInsets.all(10),
                  child: darkMode
                      ? Icon(
                    Icons.info_outline,
                    color: Colors.white,
                    size: 40,
                  )
                      : Icon(Icons.info_outline, size: 40),
                  onChanged: (value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return AboutScreen(darkMode: darkMode,);
                        }));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
