import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:people_with_disabilities/pages/admin/add_doctor.dart';
import 'package:people_with_disabilities/pages/admin/admin_home.dart';
import 'package:people_with_disabilities/pages/admin/fetch_doctors.dart';
import 'package:people_with_disabilities/pages/user/user_fetch_doctors.dart';
import 'package:people_with_disabilities/pages/user/user_home.dart';

class UserDoctor extends StatefulWidget {
  static const routeName = '/UserDoctorScreen';
  const UserDoctor({Key? key}) : super(key: key);

  @override
  State<UserDoctor> createState() => _UserDoctorState();
}

class _UserDoctorState extends State<UserDoctor> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Align(
                  alignment: Alignment.center,
                  child: Text('الأطباء')),
                actions: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, UserHome.routeName);
                        },
                        icon: Icon(
                          Icons.arrow_forward,
                        )),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    height: 290.h,
                    child: Image.asset('assets/images/doctors.jfif'),
                  ),
                  Text(
                    'التخصصات',
                    style: TextStyle(fontSize: 27, color: HexColor('#32486d')),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.w,
                      right: 20.w,
                    ),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return UserFetchDoctors(
                                  category: 'الأعاقة السمعية',
                                );
                              }));
                            },
                            child: card('assets/images/hearing.jpg',
                                'الأعاقة السمعية')),
                        SizedBox(
                          width: 15.w,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return UserFetchDoctors(
                                  category: 'الأعاقة البصرية',
                                );
                              }));
                            },
                            child: card(
                                'assets/images/visual.png', 'الأعاقة البصرية')),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.w,
                      right: 20.w,
                    ),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return UserFetchDoctors(
                                  category: 'الأعاقة الجسدية',
                                );
                              }));
                            },
                            child: card('assets/images/physical.jpg',
                                'الأعاقة الجسدية')),
                        SizedBox(
                          width: 15.w,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return UserFetchDoctors(
                                  category: 'التوحد',
                                );
                              }));
                            },
                            child: card('assets/images/autism.png', 'التوحد')),
                      ],
                    ),
                  )
                ]),
              ),
            ));
  }
}

Widget card(String url, String text) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: SizedBox(
      width: 150.w,
      height: 170.h,
      child: Column(children: [
        SizedBox(
          height: 10.h,
        ),
        Container(width: 100.w, height: 100.h, child: Image.asset(url)),
        SizedBox(height: 5),
        Text(text, style: TextStyle(fontSize: 18, color: HexColor('#32486d')))
      ]),
    ),
  );
}
