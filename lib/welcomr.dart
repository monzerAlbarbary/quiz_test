import 'package:flutter/material.dart';
import 'package:quizprojectbaraka/res/color_app.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primary,
        appBar: AppBar(),
        body: Center(
          child: Text(
            'welcome',
            style: TextStyle(color: Colors.white, fontSize: 50),
          ),
        ));
  }
}
