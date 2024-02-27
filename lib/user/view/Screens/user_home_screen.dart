import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:med_app/user/view/Screens/user_profile.dart';

import '../../navigation/user_navigation.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  // const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return CurvedNavigationBar(
            color: Color(0xFF585CE5),
            buttonBackgroundColor: Color(0xFF585CE5),
            backgroundColor: Color(0xffffff),
            items: screensIconList,
            onTap: (index) {
              ref.watch(selectedScreenProvider.state).state = index;
            },
          );
        },
      ),
      //currentScreenProvider
      body:Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return  SafeArea(
          child: ref.watch(currentScreenProvider.state).state,
        ) ;
      },

      ),
    );
  }
}

class UserHomePage extends StatelessWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                      // margin:
                      //     const EdgeInsets.only(top: 12.0, bottom: 20.0, left: 20.0, right: 20.0),
                      decoration: const BoxDecoration(
                          color: Color(0xFF585CE5),
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              top: 25.0,
                              left: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  "Welcome Mustafa Elsayed",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 25,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            child: Container(
                              margin: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Text(
                                    "Wanna check your health with us ?\nCare with your health from now.",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 17.0,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            child: Container(
                              margin:
                              const EdgeInsets.only(top: 18.0, bottom: 0.0),
                              child: GestureDetector(
                                onTap: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    SizedBox(
                                      width: 13,
                                    ),
                                    Text(
                                      'Connect to Doctor',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, left: 20, right: 15.0),
              child: Row(
                children: const [
                  Text(
                    "Patient Readings",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CardInfo(
                    title: "Oxygen Rate",
                    value:
                    "${Random().nextInt(1)} ",
                    percentage: "${Random().nextInt(9) + 1}%",
                    status: "Higher",
                    icon: 'images/o2.svg',
                    percentageStatusIcon: 'images/ic_trend_up.svg',
                    percentageIconColor: Colors.green,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CardInfo(
                    title: "Heart Beat",
                    value: "${Random().nextInt(100)} bpm",
                    percentage: "${Random().nextInt(9) + 1}%",
                    status: "Less",
                    icon: 'images/ic_heart.svg',
                    percentageStatusIcon: 'images/ic_trend_down.svg',
                    percentageIconColor: Colors.red,
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, left: 20, right: 15.0),
              child: Row(
                children: const [
                  Text(
                    "Atmosphere Readings",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                margin: const EdgeInsets.only(top: 0.0, left: 8.0, right: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CardInfo(
                            title: "Temperature",
                            value:
                            "${Random().nextInt(35) + 0.3} ",
                            percentage: "${Random().nextInt(9) + 1}%",
                            status: "Higher",
                            icon: 'images/icons8-thermometer-100.svg',
                            percentageStatusIcon: 'images/ic_trend_up.svg',
                            percentageIconColor: Colors.green,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: CardInfo(
                            title: "Room TEM",
                            value: "${Random().nextInt(29)} ",
                            percentage: "${Random().nextInt(15) + 1}%",
                            status: "Less",
                            icon: 'images/room-temperature.svg',
                            percentageStatusIcon: 'images/ic_trend_down.svg',
                            percentageIconColor: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CardInfo(
                            title: "Air Quality CO2",
                            value:
                            "${Random().nextInt(29)} ",
                            percentage: "${Random().nextInt(9) + 1}%",
                            status: "Higher",
                            icon: 'images/co2.svg',
                            percentageStatusIcon: 'images/ic_trend_up.svg',
                            percentageIconColor: Colors.green,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: CardInfo(
                            title: "CO Rate",
                            value: "${Random().nextInt(15)} ml",
                            percentage: "${Random().nextInt(15) + 1}%",
                            status: "Less",
                            icon: 'images/carbon-monoxide.svg',
                            percentageStatusIcon: 'images/ic_trend_down.svg',
                            percentageIconColor: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardInfo extends StatelessWidget {
  String title = "",
      status = "",
      percentage = "",
      icon = "",
      value = "",
      percentageStatusIcon = "";
  Color? percentageIconColor;

  CardInfo(
      {Key? key,
      this.title = "",
      this.status = "",
      this.percentage = "",
      this.icon = "",
      this.value = "",
      this.percentageStatusIcon = "",
      this.percentageIconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                icon,
                width: 38,
                height: 38,
                color: const Color(0xFF585CE5),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.black54),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF585CE5),
                      fontSize: 16),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  percentageStatusIcon,
                  width: 16,
                  height: 16,
                  color: percentageIconColor,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 4.0, right: 4.0),
                  child: Text(
                    "$percentage $status",
                    style: const TextStyle(color: Colors.grey),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
