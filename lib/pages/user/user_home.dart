import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:people_with_disabilities/pages/landing_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:people_with_disabilities/pages/user/essay_eye.dart';
import 'package:people_with_disabilities/pages/user/essay_hear.dart';
import 'package:people_with_disabilities/pages/user/essay_outism.dart';
import 'package:people_with_disabilities/pages/user/essay_physical.dart';
import 'package:people_with_disabilities/pages/user/user_courses.dart';
import 'package:people_with_disabilities/pages/user/user_doctor.dart';
import '../models/users_model.dart';

class UserHome extends StatefulWidget {
  static const routeName = '/UserHomeScreen';
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  late DatabaseReference base;
  late FirebaseDatabase database;
  late FirebaseApp app;
  late Users currentUser;

  void didChangeDependencies() {
    getUserData();
    super.didChangeDependencies();
  }

  void initState() {
    getUserData();
    super.initState();
  }

  getUserData() async {
    app = await Firebase.initializeApp();
    database = FirebaseDatabase(app: app);
    base = database
        .reference()
        .child("users")
        .child(FirebaseAuth.instance.currentUser!.uid);

    final snapshot = await base.get();
    setState(() {
      currentUser = Users.fromSnapshot(snapshot);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => Scaffold(
            appBar: AppBar(
              title: const Align(
                  alignment: Alignment.center, child: Text('الصفحة الرئيسية')),
            ),
            drawer: Drawer(
              child: FutureBuilder(
                future: getUserData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (currentUser == null) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView(
                      // Important: Remove any padding from the ListView.
                      padding: EdgeInsets.zero,
                      children: [
                        DrawerHeader(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Center(
                                child: CircleAvatar(
                                  backgroundColor: Colors.amber.shade500,
                                  radius: 30,
                                  backgroundImage:
                                      AssetImage('assets/images/person.png'),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text("${currentUser.fullName}",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ],
                          ),
                        ),
                        Material(
                            color: Colors.transparent,
                            child: InkWell(
                                splashColor: Theme.of(context).splashColor,
                                child: ListTile(
                                  onTap: () {
                                    Navigator.pushNamed(context, UserDoctor.routeName);
                                  },
                                  title: Text('حجز موعد مع طبيب'),
                                  leading: Icon(Icons.access_time),
                                ))),
                        Material(
                            color: Colors.transparent,
                            child: InkWell(
                                splashColor: Theme.of(context).splashColor,
                                child: ListTile(
                                  onTap: () {
                                    Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return UserCourses(
                                  
                                );
                              }));
                                  },
                                  title: Text('حجز دورة تدريبية'),
                                  leading: Icon(Icons.task),
                                ))),
                        Divider(
                          thickness: 0.80,
                          color: Colors.grey,
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.person,
                          ),
                          title: const Text('اسم المستخدم'),
                          subtitle: Text('${currentUser.fullName}'),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.email,
                          ),
                          title: const Text('البريد الالكترونى'),
                          subtitle: Text('${currentUser.email}'),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.phone,
                          ),
                          title: const Text('رقم الهاتف'),
                          subtitle: Text('${currentUser.phoneNumber}'),
                        ),
                        Divider(
                          thickness: 0.80,
                          color: Colors.grey,
                        ),
                        Material(
                            color: Colors.transparent,
                            child: InkWell(
                                splashColor: Theme.of(context).splashColor,
                                child: ListTile(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text('تأكيد'),
                                            content:
                                                Text('هل انت متأكد من تسجيل الخروج'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  FirebaseAuth.instance
                                                      .signOut();
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
                                  title: Text('تسجيل الخروج'),
                                  leading: Icon(Icons.exit_to_app_rounded),
                                )))
                      ],
                    );
                  }
                },
              ),
            ),
            body: Column(
              children: [
                Image.asset('assets/images/user_home.jpg'),
                Text('مقالات عن بعض امراض ذو الأعاقة',
                    style: TextStyle(fontSize: 22, color: HexColor('#32486d'))),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, EssayHear.routeName);
                          },
                          child: card(
                              'assets/images/hearing.jpg', 'الأعاقة السمعية')),
                      SizedBox(
                        width: 15.w,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, EssayEye.routeName);
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
                            Navigator.pushNamed(context, EssayPhysical.routeName);
                          },
                          child: card(
                              'assets/images/physical.jpg', 'الأعاقة الجسدية')),
                      SizedBox(
                        width: 15.w,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, EssayOutism.routeName);
                          },
                          child: card('assets/images/autism.png', 'التوحد')),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
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
}
