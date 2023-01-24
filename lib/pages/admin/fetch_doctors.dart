import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:people_with_disabilities/pages/admin/admin_doctor.dart';
import 'package:people_with_disabilities/pages/models/doctors_model.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class FetchDoctors extends StatefulWidget {
  String category;
  FetchDoctors({required this.category});

  @override
  State<FetchDoctors> createState() => _FetchDoctorsState();
}

class _FetchDoctorsState extends State<FetchDoctors> {
  late DatabaseReference base;
  late FirebaseDatabase database;
  late FirebaseApp app;
  List<Doctors> doctorsList = [];
  List<String> keyslist = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchDoctors();
  }

  @override
  void fetchDoctors() async {
    app = await Firebase.initializeApp();
    database = FirebaseDatabase(app: app);
    base = database.reference().child("doctors").child("${widget.category}");
    base.onChildAdded.listen((event) {
      print(event.snapshot.value);
      Doctors p = Doctors.fromJson(event.snapshot.value);
      doctorsList.add(p);
      print(doctorsList.length);
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
                        child: Text('اطباء ${widget.category}')),
                    actions: [
                       Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, AdminDoctor.routeName);
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
                    itemCount: doctorsList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10.h,
                            ),
                            child: CircleAvatar(
                              radius: 37,
                              backgroundImage: NetworkImage(
                                  '${doctorsList[index].imageUrl.toString()}'),
                            ),
                          ),
                          Text(
                            '${doctorsList[index].name.toString()}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Text('${doctorsList[index].price.toString()} جنيه'),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            super.widget));
                                base
                                    .child(doctorsList[index].id.toString())
                                    .remove();
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
