import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class EssayEye extends StatefulWidget {
  static const routeName = '/essayEyeScreen';
  const EssayEye({Key? key}) : super(key: key);

  @override
  State<EssayEye> createState() => _EssayEyeState();
}

class _EssayEyeState extends State<EssayEye> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => Scaffold(
            appBar: AppBar(title: Text('الأعاقة البصرية')),
            body: Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Padding(
                    padding:  EdgeInsets.only(
                      right: 10.w
                    ),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.center,
                            child: Text(' التشخيص والأسباب',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: HexColor('#315e80')))),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'لإعاقة البصرية هي فقد الإنسان لحاسة البصر بشكل آلي أو جزئي بحيث يعتمد على حواسه الأخرى، وبعض الوسائل والأدوات الخاصة لتعويض هذا النقص.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: Text('أسباب الإعاقة البصرية:',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: HexColor('#315e80')))),
                        Text(
                          'أسباب ما قبل الولادة: وهي إما نتيجة عوامل وراثية أو عوامل تتعرض لها الأم الحامل، فتؤثر على الجهاز البصري للجنين.\nأسباب أثناء الولادة: كالولادة المتعسرة ونقص الأوكسجين.\nأسباب بعد الولادة: وهي زيادة نسبة الأوكسجين المعطى للطفل الخداج، والإصابات التي تتعرض لها العين كالصدمات الشديدة والأمراض التي تصيب العين وأهمها التراخوما والرمد والماء الأبيض الأزرق، والإهمال في معالجة بعض الصعوبات البصرية البسيطة.',
                          style: TextStyle(fontSize: 16),
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: Text('أنواع الأعاقة البصرية:',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: HexColor('#315e80')))),
                        Text('للإعاقة البصرية فئتين( فئة المكفوفين، وفئة ضعاف البصر) ولضعاف البصر أشكال مختلفة منها:\nطول النظر : حيث يعاني الفرد من صعوبة في رؤية الأجسام القريبة، ويعود السبب في طول النظر إلى قصر عمق  كرة العين وتكون قدرته على رؤية الأجسام البعيدة عادية.\nقصر النظر : يواجه الفرد فيها صعوبة في رؤية الأجسام البعيدة بوضوح. وتكمن المشكلة في أن  عمق كرة العين من المقدمة للخلف يكون كبيراً. ',
                        style: TextStyle(fontSize: 16),),
                        Text(
                          'الماء الأزرق ( الجلاكوما) : هي حالة تنتج عن ازدياد في إفراز السائل المائي داخل العين مما يؤدي إلى ارتفاع الضغط على العصب البصري.\nالحول : عبارة عن اضطراب في عضلات العين ينتج عنه عدم القدرة على التحكم في العين مما يعيق وظيفة الإبصار عن الأداء الطبيعي ويؤثر على مجال الرؤية.\nاللا رؤية: بحيث لا تكون الرؤية والصورة واضحة جراء عدم الانتظام في انكسار الضوء الساقط على القرنية والعدسة. وهذه الحالة بالإمكان علاجها بالجراحة أو العدسات اللاصقة.',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'الماء الأبيض أو عتامة عدسة العين : وهو مرض إعتام في عدسة العين وفقدان سفافيتها يؤدي إلى عدم القدرة على الرؤيا، يصاب بهذا المرض كبار السن، وقد يحدث مبكراً لأسباب وراثية، كما قد يصيب صغار السن والشباب نتيجة ضربات شديدة على العين أو تعرض العين لمواد سامة أو حرارة شديدة، وبالإمكان علاجه عن طريق الجراحة.\nرأرأة العين : عبارة عن تذبذب السريع وحركات لا إرادية في مقلة العين، مما ينتج عنه القدرة على التركيز في الموضوع المرئي، وقد تسبب الغثيان.',
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
