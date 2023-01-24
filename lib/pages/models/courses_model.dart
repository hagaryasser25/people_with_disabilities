import 'package:flutter/cupertino.dart';

class Courses {
  Courses({
    String? id,
    String? code,
    int? date,
    String? start,
    String? name,
    String? duration,
    String? price,
  }) {
    _id = id;
    _code = code;
    _date = date;
    _start= start;
    _name = name;
    _duration = duration;
    _price = price;
  }

  Courses.fromJson(dynamic json) {
    _id = json['id'];
    _code = json['code'];
    _date = json['date'];
    _start = json['startDate'];
    _name = json['name'];
    _duration = json['duration'];
    _price = json['price'];
  }

  String? _id;
  String? _code;
  int? _date;
  String? _start;
  String? _name;
  String? _duration;
  String? _price;

  String? get id => _id;
  String? get code => _code;
  String? get start => _start;
  String? get name => _name;
  String? get duration => _duration;
  String? get price => _price;
  int? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['code'] = _code;
    map['startDate'] = _start;
    map['name'] = _name;
    map['duration'] = _duration;
    map['price'] = _price;
    map['date'] = _date;

    return map;
  }
}
