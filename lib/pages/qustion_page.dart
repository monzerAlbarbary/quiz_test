import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizprojectbaraka/res/color_app.dart';
import 'package:quizprojectbaraka/welcomr.dart';

import '../server/server_Api.dart';

PageController pageController = PageController();

class QustionPage extends StatelessWidget {
  const QustionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0.0),
        ),
        backgroundColor: primary,
        body: FutureBuilder(
          future: QuizApi(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return PageView.builder(
                controller: pageController,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, indexFut) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: Container(
                          height: 205,
                          width: 281,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [
                                container1,
                                container2,
                              ],
                            ),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                'Question ${indexFut + 1} / ${snapshot.data!.length} ',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffA42FC1)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 25,
                                  left: 10,
                                  right: 10,
                                  bottom: 10,
                                ),
                                child: Text(
                                  snapshot.data![indexFut].question,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data![indexFut].answers.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 60),
                            child: InkWell(
                                onTap: () {
                                  if (index ==
                                      snapshot.data![indexFut].indexOfCorrect) {
                                    if (indexFut + 1 < snapshot.data!.length) {
                                      pageController.nextPage(
                                          duration: Duration(seconds: 1),
                                          curve: Curves.linear);
                                    } else {
// الانتقال إلى الصفحة الجديدة عند الإجابة الصحيحة على السؤال الأخير
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Welcome()), // استبدل WelcomePage بالصفحة المطلوبة
                                      );
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'The answer is wrong! Try again.'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                },

                                //   if (indexFut ==
                                //       snapshot.data![indexFut].indexOfCorrect) {
                                //     pageController.nextPage(
                                //         duration: Duration(seconds: 1),
                                //         curve: Curves.linear);
                                //   } else {
                                //     ScaffoldMessenger.of(context)
                                //         .showSnackBar(SnackBar(
                                //       content: Text(
                                //           'The answer is wrong! Try again.'),
                                //       backgroundColor: Colors.red,
                                //     ));
                                //   }
                                // },
                                child: ListTile(
                                  tileColor: Colors.white,
                                  shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  title: Center(
                                    child: Text(
                                      snapshot.data![indexFut].answers[index],
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      )
                    ],
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
