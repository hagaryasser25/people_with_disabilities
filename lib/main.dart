import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:people_with_disabilities/pages/admin/add_doctor.dart';
import 'package:people_with_disabilities/pages/admin/add_jobs.dart';
import 'package:people_with_disabilities/pages/admin/admin_doctor.dart';
import 'package:people_with_disabilities/pages/admin/admin_home.dart';
import 'package:people_with_disabilities/pages/admin/admin_jobs.dart';
import 'package:people_with_disabilities/pages/admin/booking_list.dart';
import 'package:people_with_disabilities/pages/admin/course_list.dart';
import 'package:people_with_disabilities/pages/admin/doctor_list.dart';
import 'package:people_with_disabilities/pages/admin/fetch_doctors.dart';
import 'package:people_with_disabilities/pages/admin/jobs_list.dart';
import 'package:people_with_disabilities/pages/auth/admin_login.dart';
import 'package:people_with_disabilities/pages/auth/login.dart';
import 'package:people_with_disabilities/pages/auth/signup.dart';
import 'package:people_with_disabilities/pages/landing_page.dart';
import 'package:people_with_disabilities/pages/models/users_model.dart';
import 'package:people_with_disabilities/pages/user/book_doctor.dart';
import 'package:people_with_disabilities/pages/user/doctor_details.dart';
import 'package:people_with_disabilities/pages/user/essay_eye.dart';
import 'package:people_with_disabilities/pages/user/essay_hear.dart';
import 'package:people_with_disabilities/pages/user/essay_outism.dart';
import 'package:people_with_disabilities/pages/user/essay_physical.dart';
import 'package:people_with_disabilities/pages/user/user_doctor.dart';
import 'package:people_with_disabilities/pages/user/user_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: FirebaseAuth.instance.currentUser == null
          ? const LandingPage()
          : FirebaseAuth.instance.currentUser!.email == 'admin@gmail.com'
              ? const AdminHome()
              : const UserHome(),
      routes: {
        LoginScreen.routeName: (ctx) => LoginScreen(),
        SignUpScreen.routeName: (ctx) => SignUpScreen(),
        UserHome.routeName: (ctx) => UserHome(),
        AdminLoginScreen.routeName: (ctx) => AdminLoginScreen(),
        AdminHome.routeName: (ctx) => AdminHome(),
        AdminDoctor.routeName: (ctx) => AdminDoctor(),
        AddDoctor.routeName: (ctx) => AddDoctor(),
        LandingPage.routeName: (ctx) => LandingPage(),
        EssayEye.routeName: (ctx) => EssayEye(),
        EssayHear.routeName: (ctx) => EssayHear(),
        EssayOutism.routeName: (ctx) => EssayOutism(),
        EssayPhysical.routeName: (ctx) => EssayPhysical(),
        UserDoctor.routeName: (ctx) => UserDoctor(),
        BookingList.routeName: (ctx) => BookingList(),
        DoctorList.routeName: (ctx) => DoctorList(),
        CourseList.routeName: (ctx) => CourseList(),
        AddJob.routeName: (ctx) => AddJob(),
        AdminJobs.routeName: (ctx) => AdminJobs(),
        JobsList.routeName: (ctx) => JobsList(),
      },
    );
  }
}
