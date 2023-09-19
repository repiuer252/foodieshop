import 'dart:async';

import 'package:flutter/material.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:uts_asli/loginpake/login.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  late StreamSubscription _sub;
  final Stream _myStream =
      Stream.periodic(const Duration(milliseconds: 200), (int count) {
    return count;
  });
  // ignore: non_constant_identifier_names
  int _Persen = 100;
  int getSteam = 0;
  double circular = 1;

  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    _sub = _myStream.listen((event) {
      getSteam = int.parse(event.toString());
      setState(() {
        if (_Persen - getSteam <= 0) {
          _sub.cancel();
          _Persen = 0;
          circular = 0;
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const Login()));
        } else {
          _Persen = _Persen - getSteam;
          circular = _Persen / 100;
        }
      });
    });
    // var duration = Duration(seconds: 5);
    // return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Login()));
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 68, 81),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset("images/logo.png"),
            ),
            const Padding(padding: EdgeInsets.only(top: 20.0)),

            // Padding(padding: EdgeInsets.only(top: 20.0)),
            // CircularProgressIndicator(
            //   backgroundColor: Colors.white,
            //   strokeWidth: 1,
            // ),
            Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  Expanded(
                      child: CircularPercentIndicator(
                        progressColor: Colors.black,
                    radius: 50,
                    lineWidth: 10,
                    percent: circular,
                    
                  ))
                ]))
          ],
        ),
      ),
    );
  }
}
