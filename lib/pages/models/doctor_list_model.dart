import 'package:flutter/cupertino.dart';

class DoctorsBookings {
  DoctorsBookings({
    String? doctorName,
    String? userEmail,
    String? date,
    String? status,

  }) {
    _doctorName = doctorName;
    _userEmail = userEmail;
    _date = date;
    _status= status;
  }

  DoctorsBookings.fromJson(dynamic json) {
    _doctorName = json['doctorName'];
    _userEmail = json['userEmail'];
    _date = json['date'];
    _status = json['status'];
  }

  String? _doctorName;
  String? _userEmail;
  String? _date;
  String? _status;

  String? get doctorName => _doctorName;
  String? get userEmail => _userEmail;
  String? get status => _status;
  String? get date => _date;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['doctorName'] = _doctorName;
    map['userEmail'] = _userEmail;
    map['status'] = _status;
    map['date'] = _date;


    return map;
  }
}