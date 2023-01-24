import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:people_with_disabilities/pages/admin/add_courses.dart';
import 'package:people_with_disabilities/pages/admin/add_doctor.dart';
import 'package:people_with_disabilities/pages/admin/fetch_courses.dart';
import 'package:people_with_disabilities/pages/admin/fetch_doctors.dart';
import 'package:people_with_disabilities/pages/user/user_fetch_courses.dart';
import 'package:people_with_disabilities/pages/user/user_home.dart';

class UserCourses extends StatefulWidget {
  static const routeName = '/userCoursesScreen';
  const UserCourses({Key? key}) : super(key: key);

  @override
  State<UserCourses> createState() => _UserCoursesState();
}

class _UserCoursesState extends State<UserCourses> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Align(
                    alignment: Alignment.center,
                    child: Text('الدورات التدريبية')),
                actions: [
                  Align(
                    alignment: Alignment.topLeft,
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
                                return UserFetchCourses(
                                  category: 'الخياطة',
                                );
                              }));
                            },
                            child: card('assets/images/sweing.png', 'الخياطة')),
                        SizedBox(
                          width: 15.w,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return UserFetchCourses(
                                  category: 'النجارة',
                                );
                              }));
                            },
                            child:
                                card('assets/images/carpentry.png', 'النجارة')),
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
                                return UserFetchCourses(
                                  category: 'الحاسب الآلى',
                                );
                              }));
                            },
                            child: card(
                                'assets/images/computer.jpg', 'الحاسب الآلى')),
                        SizedBox(
                          width: 15.w,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return UserFetchCourses(
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
