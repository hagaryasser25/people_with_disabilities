import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:people_with_disabilities/pages/admin/admin_courses.dart';
import 'package:people_with_disabilities/pages/models/courses_model.dart';
import 'package:people_with_disabilities/pages/models/doctors_model.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class FetchCourses extends StatefulWidget {
  String category;
  FetchCourses({required this.category});

  @override
  State<FetchCourses> createState() => _FetchCoursesState();
}

class _FetchCoursesState extends State<FetchCourses> {
  late DatabaseReference base;
  late FirebaseDatabase database;
  late FirebaseApp app;
  List<Courses> coursesList = [];
  List<String> keyslist = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchCourses();
  }

  @override
  void fetchCourses() async {
    app = await Firebase.initializeApp();
    database = FirebaseDatabase(app: app);
    base = database.reference().child("courses").child("${widget.category}");
    base.onChildAdded.listen((event) {
      print(event.snapshot.value);
      Courses p = Courses.fromJson(event.snapshot.value);
      coursesList.add(p);
      print(coursesList.length);
      keyslist.add(event.snapshot.key.toString());
      setState(() {});
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
                  automaticallyImplyLeading: false,
                  title: Align(
                      alignment: Alignment.center,
                      child: Text('دورة ${widget.category}')),
                  actions: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, AdminCourses.routeName);
                          },
                          icon: Icon(
                            Icons.arrow_forward,
                          )),
                    ),
                  ],
                ),
                body: Container(
                  decoration: BoxDecoration(color: HexColor('#eaf2f8')),
                  child: StaggeredGridView.countBuilder(
                    padding: EdgeInsets.only(
                      top: 20.h,
                      left: 15.w,
                      right: 15.w,
                      bottom: 15.h,
                    ),
                    crossAxisCount: 6,
                    itemCount: coursesList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(children: [
                          SizedBox(height: 10.h),
                          Text(
                            '${coursesList[index].name.toString()}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 5.h),
                          Text('${coursesList[index].price.toString()} جنيه'),
                          SizedBox(height: 5.h),
                          Text(
                              'تاريخ البدأ: ${coursesList[index].start.toString()}'),
                          SizedBox(height: 5.h),
                          Text(
                              'لمدة ${coursesList[index].duration.toString()}'),
                          SizedBox(height: 5.h),
                          InkWell(
                            onTap: () async{
                              Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            super.widget));
                                base
                                    .child(coursesList[index].id.toString()).remove();
                            },
                            child: Icon(Icons.delete,
                                color: Color.fromARGB(255, 122, 122, 122)),
                          )
                        ]),
                      );
                    },
                    staggeredTileBuilder: (int index) =>
                        new StaggeredTile.count(3, index.isEven ? 3 : 3),
                    mainAxisSpacing: 12.0,
                    crossAxisSpacing: 5.0,
                  ),
                ),
              )),
    );
  }
}
