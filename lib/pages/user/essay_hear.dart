import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class EssayHear extends StatefulWidget {
  static const routeName = '/essayHearScreen';
  const EssayHear({Key? key}) : super(key: key);

  @override
  State<EssayHear> createState() => _EssayHearState();
}

class _EssayHearState extends State<EssayHear> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => Scaffold(
            appBar: AppBar(title: Text('الأعاقة السمعية')),
            body: Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: 10.w
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: Text('ما هى الأعاقة السمعية : ',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: HexColor('#315e80')))),
                        Text(
                          'تعرف الإعاقة السمعية بأنها حرمان الطفل من حاسة السمع إلى درجة تجعل الكلام المنطوق ثقيل السمع مع أو بدون استخدام المعينات ، وتشتمل الإعاقة السمعية الأطفال الصم وضعاف السمع.',
                          style: TextStyle(fontSize: 16),
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: Text('أسباب الأعاقة السمعية',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: HexColor('#315e80')))),
                        Text(
                          'ترجع الإعاقات السمعية إلى مجموعة من الأسباب بعضها وراثي والبعض الآخر يرتبط بعوامل ومؤثرات غير ذات أصل جيني ، يمكن بوجه عام تصنيف العوامل التي تؤدي إلى إعاقات في السمع الى ثلاثة أنواع رئيسية طبقا للزمن الذي تحدث فيه الإصابة',
                          style: TextStyle(fontSize: 16),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                              'أ‌- عوامل تحدث قبل الولادة\nب‌- عوامل تقع أثناء الولادة\nت‌- عوامل تؤثر فيما بعد الولادة',
                              style: TextStyle(fontSize: 16)),
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: Text('أنواع الأعاقة السمعية',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: HexColor('#315e80')))),
                        Text(
                          'الإعاقة السمعية التوصيلية :- هي التي تحدث نتيجة أي خطأ أو شذوذ في جهاز توصيل الذبذبات الصوتية الذي يشتمل الأذن الخارجية والطبلة والأذن الوسطى بعظيماتها الثلاث\nالإعاقة السمعية العصبية : هي التي تحدث أي خطأ أو تلف أو شذوذ في جهاز الإدراك او الجسم الذي يشمل عضو السمع في الأذن الداخلية في القوقعة الحلزونية وعصب السمع ومركز السمع بالمخ.',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'الإعاقة السمعية المختلطة : تحدث هذه الإعاقة في الأذن الداخلية والوسطى وهو عبارة عن ضعف سمع مشترك يحوي ضعف السمع التوصيلي وضعف السمع العصبي نتيجة لوجود خلل في اجزاء الأذن الثلاث .\nالإعاقة السمعية المركزية : تحدث نتيجة لأي خلل بين عنق المخ والقشرة الدماغية ، والسبب في ذلك قد يرجع الى سرطان في الدماغ أو التهابات في غشاء المخ أو تصلب اللويحي يكون للمرض نفسه الأعراض وكل الشرايين المرتبطة في الدماغ تتصلب بالتدريج وبالتالي فإن الدم يتصلب في الدماغ وأغلب الأحيان من يصاب بهذين المرضين يموتون أو يصابون بأغماء ، واذا طالت المدة ما بين الإغماء والإستيقاظ كان الخطر أكثر وزاد التصلب للشرايين ، والسرطان يعمل ضغط على الدماغ وكلما زاد الضغط يكون أكثر خطرا على الدماغ .',
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
