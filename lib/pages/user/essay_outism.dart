import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class EssayOutism extends StatefulWidget {
  static const routeName = '/essayOutismScreen';
  const EssayOutism({Key? key}) : super(key: key);

  @override
  State<EssayOutism> createState() => _EssayOutismState();
}

class _EssayOutismState extends State<EssayOutism> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => Scaffold(
            appBar: AppBar(title: Text('التوحد')),
            body: Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Padding(
                    padding:  EdgeInsets.only(
                      right: 10.w,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: Text('مرض التوحد : ',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: HexColor('#315e80')))),
                        Text(
                          'هناك عددا من الأمراض الشائعة حول العالم و التي يمكن أن تؤثر على الكثير من الأفراد, و منها مرض التوحد حيث ازداد المرض في وقتنا الحالي بين الأطفال أكثر من غيرهم خاصة الأطفال الذين تتراوح أعمارهم بين سنتين أو سنتين و نصف. فانتشار العدوى بين الذكور أعلى منها عند الاناث.\nفوفقا لاحصائيات تم اجرائها في الولايات المتحدة, اتضح أن من بين 1000 طفل, هناك ستة أطفال مصابون بالتوحد و أوضحت الاحصائيات أن عدد حالات الاصابة بالمرض تزداد بشكل مطرد',
                          style: TextStyle(fontSize: 16),
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: Text('أعراض مرض التوحد',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: HexColor('#315e80')))),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            '- تفضيل الطفل البقاء وحيدا.\n- عدم الرغبة في تدخل الاخرين في حزنه.\n- عدم اهتمامه باللعب أو التحدث الى الاخرين.\n- رفض ومحاولة تجنب التواصل الجسدي.\n- عدم فهمه لمشاعره أو مشاعر الاخرين.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: Text('علاج التوحد',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: HexColor('#315e80')))),
                        Text(
                          '1- تحليل السلوك التطبيقي: يشجع الطفل على القيام بسلوكيات ايجابية وتجنب السلوكيات السلبية كما يعلم الطفل مهارات جديدة.\n2- علاج النطق: يساعد علاج النطق على تقوية التواصل الاجتماعي لدى الطفل كما يحسن قدرته/ها على التعبير عن احتياجاته/تها وأمنياته/ها.',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '3- العلاج الفيزيائي: يساعد على تعليم الشخص المصاب القيام بمهارات حركية مهمة و كذلك تحسين التكامل الحسي. فالعلاج الفيزيائي مهم في تعليم و تطوير مهارات التنسيق, التوازن, المشي و الجلوس.\n4- الأدوية: يقوم الفيزيائي المختص بكتابة العلاج لزيادة الفائدة من الأدوية الاخرى المستخدمة في علاج التوحد. تقوم هذه الادوية بتهدئة بعض السلوكيات الانفعالية التي يمارسها الشخص.',
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                )),
          ),
        ));
  }
}