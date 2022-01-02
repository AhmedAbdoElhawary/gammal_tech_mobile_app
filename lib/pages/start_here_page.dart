import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gammal_tech_mobile_app/Common%20UI/app_bar.dart';
import 'package:gammal_tech_mobile_app/Common%20UI/button_of_view_courses.dart';
import 'package:gammal_tech_mobile_app/Common%20UI/head_card_of_text.dart';
import 'package:gammal_tech_mobile_app/Common%20UI/the_bottom_bar_of_youtube.dart';
import 'package:gammal_tech_mobile_app/Common%20UI/the_video.dart';
import 'package:url_launcher/url_launcher.dart';

import 'courses_page.dart';

class StartHerePage extends StatelessWidget {
  String textIndex;
  StartHerePage(this.textIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildContainer(context),
    );
  }

  Column buildContainer(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            color: const Color.fromARGB(215, 11, 108, 108),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  headCardOfText(textIndex),
                  buildTheVideo(true, false),
                  buildContainerOfText(),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                    child: buildTextButtonOfViewCourses(
                        "View Courses", const CoursesPage(), context),
                  ),
                  buildTheBottomContainer(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Directionality buildContainerOfText() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
        ),
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.center,
          child: buildTextQuestion(),
        ),
      ),
    );
  }

  SizedBox buildSizedBox() => const SizedBox(height: 15);

  Directionality buildTextQuestion() {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          const Text(
            "في ما يلي بعض من المشتركين علي الموقع الذين التحقوا بالتدريب العملي في شركتنا بعد إنتهاء التدريب الأونلاين"
            "\n",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
          ),
          buildTheVideo(true, true),
          buildTheVideo(true, true),
          const Text(
            "\n"
            "\n"
            "من أين نبدأ تعلم البرمجة؟"
            "\n"
            "\n"
            "    مجال البرمجة مجال كبير جدا وبه تخصصات كثيرة، لكن كل تخصص يمكنه أن يزيد الطلب عليه أو يقل حسب تغيرات سوق العمل، فبعض الناس يختارون التخصص علي أساس أكثر تخصص مطلوب لكن بعد فترة يتغير سوق العمل ولا يصبح التخصص مطلوب بعد ذلك. لذا فإن أفضل بداية في مجال البرمجة هي البداية التي تجعلك قادر علي العمل في جميع التخصصات وعندما يزداد الطلب علي تخصص ما تستطيع العمل فيه وعندما يقل الطلب ويزداد في تخصص آخر تستطيع أيضا أن تغير تخصصك للتخصص المطلوب"
            "\n"
            "\n"
            'الطريقة الوحيدة لتكون قادر علي العمل في جميع التخصصات هي أن تكون'
            "\n"
            'Software Engineer'
            "\n"
            "\n"
            'وهذا يعني أنك مهندس في مجال البرمجة وليس مجرد مبرمج عادي وتستطيع أن تتعلم هندسة البرمجيات من خلال موقعنا\n'
            "\n"
            "\n"
            'هذه قائمة بأفضل كورسات البرمجة ويجب أن تدرسها بالترتيب في موقعنا حيث يعتمد كل كورس علي الكورس الذي قبله'
            "\n"
            "\n"
            'C Programming'
            "\n"
            "\n"
            'C++'
            "\n"
            "\n"
            'Data Structures'
            "\n"
            "\n"
            'Algorithms'
            "\n"
            "\n"
            'OOP'
            "\n"
            "\n"
            'ومن ثم بعد أن تنتهي من هذه الكورسات تبدأ في تعلم الأقسام المختلفة داخل مجالات البرمجة حتي تستطيع إختيار القسم الأنسب لتكون متخصصا فيه'
            '\n'
            "\n"
            "\n"
            '    ---------------------------------'
            '\n'
            "\n"
            "\n"
            'إذا واجهتك مشكلة آثناء إستخدام الموقع برجاء الإتصال بنا في أقرب وقت'
            '\n'
            "\n"
            "\n"
            'أوقات العمل الرسمية من الأحد إلي الخميس من الساعة التاسعة صباحا وحتي الخامسة مساءا بتوقيت القاهرة'
            '\n'
            "\n"
            "\n"
            'رقم التليفون والواتساب',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
          ),
          InkWell(
              onTap: () => launch("tel:+201033998844"),
              child: Text(
                "+201033998844",
                style: TextStyle(color: Colors.blue[700]),
              )),
        ],
      ),
    );
  }
}
