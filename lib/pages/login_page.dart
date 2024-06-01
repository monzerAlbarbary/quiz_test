import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizprojectbaraka/controller_app.dart';
import 'package:quizprojectbaraka/res/color_app.dart';
import 'package:quizprojectbaraka/res/image_app.dart';

import '../res/text_style_app.dart';
import '../server/server_Api.dart';
import '../widget/container_button_widget.dart';
import '../widget/position_widget.dart';
import '../widget/text_field_widget.dart';
import 'qustion_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Image.asset(image11),
              PositionWidget(
                top: 5,
                left: 45,
                image: image14,
              ),
              Positioned(
                child: Image.asset(image12),
              ),
              PositionWidget(
                top: 50,
                left: 250,
                image: image15,
              ),
              PositionWidget(
                top: 150,
                left: 40,
                image: image13,
              ),
              Positioned(
                top: 100,
                left: 150,
                child: Text('LOGIN', style: textStyle1),
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(
                  top: 100, right: 30, left: 30, bottom: 40),
              child: Column(
                children: [
                  TextFieldWidget(
                    textEditingController: email,
                    hintText: 'user@gmail.com',
                    icon: Icon(
                      Icons.email,
                      color: primary,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    textEditingController: password,
                    hintText: 'password',
                    icon: Icon(
                      Icons.key,
                      color: primary,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    onTap: () {
                      QuizApi();

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QustionPage(),
                        ),
                      );
                    },
                    child: ContainerButtonLogin(),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
