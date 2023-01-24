import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:people_with_disabilities/pages/admin/add_courses.dart';
import 'package:people_with_disabilities/pages/admin/add_doctor.dart';
import 'package:people_with_disabilities/pages/admin/fetch_courses.dart';
import 'package:people_with_disabilities/pages/admin/fetch_doctors.dart';

import 'admin_home.dart';

class AdminCourses extends StatefulWidget {
  static const routeName = '/AdminCoursesScreen';
  const AdminCourses({Key? key}) : super(key: key);

  @override
  State<AdminCourses> createState() => _AdminCoursesState();
}

class _AdminCoursesState extends State<AdminCourses> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Align(
                    alignment: Alignment.topRight,
                    child: TextButton.icon(
                      // Your icon here
                      label: Text(
                        'اضافة دورة تدريبية',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      icon: Align(
                          child: Icon(
                        Icons.add,
                        color: Colors.white,
                      )), // Your text here
                      onPressed: () {
                        Navigator.pushNamed(context, AddCourse.routeName);
                      },
                    )),
                actions: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AdminHome.routeName);
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
                    child: Image.asset('assets/images/courses.jpg'),
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
                                return FetchCourses(
                                  category: 'الخياطة',
                                );
                              }));
                            },
                            child: card('assets/images/sweing.png',
                                'الخياطة')),
                        SizedBox(
                          width: 15.w,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return FetchCourses(
                                  category: 'النجارة',
                                );
                              }));
                            },
                            child: card(
                                'assets/images/carpentry.png', 'النجارة')),
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
                                return FetchCourses(
                                  category: 'الحاسب الآلى',
                                );
                              }));
                            },
                            child: card('assets/images/computer.jpg',
                                'الحاسب الآلى')),
                        SizedBox(
                          width: 15.w,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return FetchCourses(
                                  category: 'الرسم',
                                );
                              }));
                            },
                            child: card('assets/images/drawing.jpg', 'الرسم')),
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
