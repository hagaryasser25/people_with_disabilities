import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:people_with_disabilities/pages/admin/add_doctor.dart';
import 'package:people_with_disabilities/pages/admin/admin_courses.dart';
import 'package:people_with_disabilities/pages/admin/admin_doctor.dart';
import 'package:people_with_disabilities/pages/admin/doctor_list.dart';
import 'package:people_with_disabilities/pages/landing_page.dart';

import 'course_list.dart';

class BookingList extends StatefulWidget {
  static const routeName = '/bookingList';
  const BookingList({Key? key}) : super(key: key);

  @override
  State<BookingList> createState() => _BookingListState();
}

class _BookingListState extends State<BookingList> {
  
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
                      child: Text('قائمة الحجوزات')),
                ),
                body: SingleChildScrollView(
                  child: Column(children: [
                    Image.asset('assets/images/booking_list.jpeg'),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      'الخدمات المتاحة',
                      style:
                          TextStyle(fontSize: 27, color: HexColor('#32486d')),
                    ),
                    SizedBox(
                      height: 10.h,
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
                                    context, DoctorList.routeName);
                              },
                              child: card('assets/images/doctor2.jpg',
                                  'حجوزات الاطباء')),
                          SizedBox(
                            width: 15.w,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, CourseList.routeName);
                              },
                              child: card('assets/images/courses.png',
                                  'حجوزات الدورات')),
                        ],
                      ),
                    ),
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
