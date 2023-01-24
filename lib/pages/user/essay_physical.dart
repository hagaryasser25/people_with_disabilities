import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class EssayPhysical extends StatefulWidget {
  static const routeName = '/essayPhysicalScreen';
  const EssayPhysical({Key? key}) : super(key: key);

  @override
  State<EssayPhysical> createState() => _EssayPhysicalState();
}

class _EssayPhysicalState extends State<EssayPhysical> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => Scaffold(
            appBar: AppBar(title: Text('الأعاقة الجسدية')),
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
                            child: Text('ما هى الأعاقة الجسدية : ',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: HexColor('#315e80')))),
                        Text(
                          'الإعاقة الجسدية هي الإعاقة الناتجة من عيوب بدنية أو جسمية، وهذه العيوب متعلّقة بالعظام والمفاصل والعضلات، ويُطلق على الشخص المُصاب بمثل هذه العيوب معاق بدنياً أو حركيّاً، ويرى العلماء أن المعاق حركيّاً هو الشخص الذي لدية عائق جسدي يمنعه من القيام بوظائفه الحركية بشكلٍ طبيعي، وذلك لأسباب وراثية أو مُكتسبة.',
                          style: TextStyle(fontSize: 16),
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: Text('أنواع الأعاقة الجسدية',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: HexColor('#315e80')))),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                              'أ - المصابون باضطرابات تكوينية، وهم مَن توقّف نمو الأطراف لديهم.\nب - المصابون بشلل الأطفال، وهم المصابون في الجهاز العصبي.\nج - المصابون بالشلل الدماغي، وهو اضطراب عصبي يحدث بسبب خللٍ يُصيب بعض مناطق المخ.\nد - المعاقون حركياً بسبب الحوادث والحروب والكوارث الطبيعية وإصابات العمل.',
                              style: TextStyle(fontSize: 16)),
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: Text('خصائص المعاقين جسديا : ',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: HexColor('#315e80')))),
                        Text(
                          '1- الخصائص الجسدية (الجسمية) : يتّصف المعاقون حركياً (الأطفال) بنواحي العجز المختلفة في اضطراب ونموّ عضلات الجسم التي تشمل اليدين والأصابع والقدمين والعمود الفقري، وتتّصف هذه الصعوبات بعدم التوازُن في الجلوس والوقوف وعدم مرونة العضلات الناتجة من اضطرابات في الجهاز العصبي المركزي أو الروماتيزم والكسور وغيرها، ومن مشاكلهم الجسمية أيضاً هشاشة العظام والتواءاتها وانخفاض معدّل الوزن',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '2- الخصائص النفسية : يتّصف هؤلاء الأفراد بالانسحاب والخجل والانطواء والعُزلة والاكتئاب والحزن وعدم الرضا عن الذات وعن الآخرين والشعور بالذنب والعجز والقصور ، وبالاختلاف عن الآخرين وبعدم اللياقة وبعدم الانتباه وتشتّته وبالقهرية والاعتمادية والخوف والقلق وغيرها من الاضطرابات النفسية العصبية.',
                          style: TextStyle(fontSize: 16),
                        ),
                         Text(
                          '3- الخصائص التربوية والاجتماعية : هؤلاء الأفراد لديهم مشكلات في عادات الطعام (Eating Habits) واللباس (Missy Sloppy)، ومشاكل في التبوّل وضبط المثانة والأمعاء والاستحمام والوقوف وضبطه، ومشكلات مع الأقران والأخوة والشعور بالحرمان الاجتماعي المُتمثّل في عدم مشاركتهم الفاعِلة في النشاطات الاجتماعية، إضافة إلى الانطواء الاجتماعي وقلّة التفاعُل مع الناس والخجل والعزلة والانسحاب والأفكار',
                          style: TextStyle(fontSize: 16),
                        ),
                         Text(
                          '4- خصائصهم العصبية : لدى هؤلاء الأفراد مشاكل تتعلّق بتلف في الدماغ أو خلل وظيفي في عمل الخلايا الحركية فيه، كما أن لديهم مشكلات خاصة كالصرَع والاضطرابات العقلية التي قد تكون أورام الدماغ أحد أسبابها، إضافة إلى أنهم يعانون من الشلل بجميع أشكاله والشلل الدماغي بجميع أنواعه، ولديهم أيضاً مشاكل خاصة بالحبل الشوكي ومشكلات في مجال الرؤيا والسمع ناتجة من أمراض مثل التهاب السحايا',
                          style: TextStyle(fontSize: 16),
                        ),
                  
                      ],
                    ),
                  ),
                )),
          ),
        ));
  }
}