import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:people_with_disabilities/pages/admin/add_doctor.dart';
import 'package:people_with_disabilities/pages/admin/admin_courses.dart';
import 'package:people_with_disabilities/pages/admin/admin_doctor.dart';
import 'package:people_with_disabilities/pages/admin/booking_list.dart';
import 'package:people_with_disabilities/pages/landing_page.dart';

class AdminHome extends StatefulWidget {
  static const routeName = '/AdminHomeScreen';
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}


class _AdminHomeState extends State<AdminHome> {
  
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => Scaffold(
                appBar: AppBar(
                  title: Align(
                      alignment: Alignment.center,
                      child: Text('الصفحة الرئيسية')),
                ),
                body: SingleChildScrollView(
                  child: Column(children: [
                    Image.asset('assets/images/user_home.jpg'),
                    Text(
                      'الخدمات المتاحة',
                      style:
                          TextStyle(fontSize: 27, color: HexColor('#32486d')),
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
                                Navigator.pushNamed(
                                    context, AdminDoctor.routeName);
                              },
                              child: card(
                                  'assets/images/doctor2.jpg', 'أضافة دكتور')),
                          SizedBox(
                            width: 15.w,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AdminCourses.routeName);
                              },
                              child: card('assets/images/courses.png',
                                  'أضافة دورة تدريبية')),
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
                                Navigator.pushNamed(
                                    context, BookingList.routeName);
                              },
                              child: card(
                                  'assets/images/list.png', 'قائمة الحجوزات')),
                          SizedBox(
                            width: 15.w,
                          ),
                          InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('تاكيد'),
                                        content: Text(
                                            'هل انت متأكد من تسجيل الخروج؟'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              FirebaseAuth.instance.signOut();
                                              Navigator.pushNamed(context,
                                                  LandingPage.routeName);
                                            },
                                            child: Text('نعم'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('لا'),
                                          ),
                                        ],
                                      );
                                    });
                              },
                              child: card(
                                  'assets/images/exit.png', 'تسجيل الخروج')),
                        ],
                      ),
                    )
                  ]),
                ),
              )),
    );
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
