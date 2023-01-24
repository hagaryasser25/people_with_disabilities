import 'package:flutter/cupertino.dart';

class CourseBookings {
  CourseBookings({
    String? courseCode,
    String? userEmail,
    int? date,

  }) {
    _courseCode = courseCode;
    _userEmail = userEmail;
    _date = date;
  }

  CourseBookings.fromJson(dynamic json) {
    _courseCode = json['code'];
    _userEmail = json['userEmail'];
    _date = json['date'];
  }

  String? _courseCode;
  String? _userEmail;
  int? _date;

  String? get courseCode => _courseCode;
  String? get userEmail => _userEmail;
  int? get date => _date;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _courseCode;
    map['userEmail'] = _userEmail;
    map['date'] = _date;


    return map;
  }
}