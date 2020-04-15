import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';



class FAQ extends StatefulWidget {
  static String id = 'FAQ';
  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.blue, // navigation bar color
      statusBarColor: Colors.pink, // status bar color
    ));
    // List list_name =   ['f1'];
    // var item=list_name[0];

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.orange[100],
          appBar: AppBar(
            backgroundColor: Colors.orange,
            elevation: 10.0,
            bottomOpacity: 10.0,
            toolbarOpacity: 1,
            title: Text(
              'الاسئله الشائعه',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: ArabicFonts.El_Messiri,
                package: 'google_fonts_arabic',
              ),
            ),
            centerTitle: true,
          ),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: ListView(children: [
              Dismissible(
                child: Card(
                  color: Colors.red,
                  child: Text(
                    'لمعرفة تفاصيل اكثر يرجي الضغط علي الرابط الموجود في المصدر-الكلمه باللون الاحمر-',
                    style: TextStyle(
                      fontSize: 18,
                      // backgroundColor: Colors.lightGreen,
                      letterSpacing: .5,
                      fontWeight: FontWeight.w600,
                      fontFamily: ArabicFonts.El_Messiri,
                      package: 'google_fonts_arabic',
                    ),
                  ),
                ),

                key: UniqueKey(),
                // direction: DismissDirection.startToEnd,
                // dragStartBehavior: DragStartBehavior.start,

                onDismissed: (dir) {
                  // setState(() {
                  //   list_name.removeAt(item);

                  // });
                },
              ),
              Column(
                children: <Widget>[
                  faqCard(
                      context: context,
                      answer: """
 الحج عن الميت والعمرة عن الميت من أفضل القربات، وينتفع بها الميت المسلم كثيرًا، فقد سئل النبي ﷺ عن ذلك مرات كثيرة فقال للسائل: حج عن أبيك، وللسائلة: حجي عن أبيك، والآخر: عن أمك، وسأله آخر قال: إني لبيت عن شبرمة قال: من شبرمة؟ قال: أخ لي أو قريب لي. قال: حج عن نفسك ثم حج عن شبرمة.
فالناس أقسام منهم من قد حج الفريضة وأدى العمرة الفريضة هذا إذا حج عنه يكون نافلة، وإذا اعتمر عنه يكون نافلة، حج عنه أخوه أو أبوه أو قريب له أو أخ من إخوانه في الله كل ذلك طيب وهكذا العمرة، وإذا كان ما أدى الحج ولا أدى العمرة فإن الذي يحج عنه يكون قد أدى عنه الفريضة، وهكذا العمرة يكون قد أدى عنه عمرة الفريضة، وهو على كل حال مأجور والميت مأجور كلاهما مأجور، هذا عن عمله الطيب وإحسانه إلى أخيه مأجور والميت مأجور بذلك، وهكذا الصدقة وهكذا الدعاء إذا تصدق عن أخيه يؤجر هو والميت جميعًا، وهكذا إذا دعا لأخيه الميت يؤجر هو وينتفع الميت بالدعاء. نعم.
""",
                      siteUrl:
                          'https://binbaz.org.sa/fatwas/15388/%D8%A7%D9%84%D8%AD%D8%AC-%D9%88%D8%A7%D9%84%D8%B9%D9%85%D8%B1%D8%A9-%D8%B9%D9%86-%D8%A7%D9%84%D9%85%D9%8A%D8%AA',
                      questionTitle: ' الحج والعمرة عن الميت -ابن باز-',
                      src: 'الموقع الرسمي لسماحة الامام ابن باز'),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  faqCard(
                      context: context,
                      questionTitle: 'حكم العمرة عن غير الأقرباء',
                      answer: """ 
   الحمد لله والصلاة والسلام على رسول الله وعلى آله وصحبه، أما بعـد:
فالراجح عندنا انتفاع الموتى بما يوهب لهم من الحج أو العمرة، وأنه يبلغهم ثوابه، ولا يلزم أن تكون هناك صلة بين الميت ومن يحج عنه، أو يعتمر.      
                    """,
                      siteUrl: 'https://www.islamweb.net/ar/fatwa/140820/',
                      src: 'اسلام ويب'),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  faqCard(
                      context: context,
                      questionTitle: 'تكرار الحج عن الغير',
                      answer: """ 
 لا مانع شرعًا من تكرار الحج عن الغير. ومما ذكر يعلم الجواب.
والله سبحانه وتعالى أعلم
                    """,
                      siteUrl:
                          'https://www.dar-alifta.org/ar/ViewFatwa.aspx?ID=11894&LangID=1&MuftiType=&%D8%AA%D9%83%D8%B1%D8%A7%D8%B1_%D8%A7%D9%84%D8%AD%D8%AC_%D8%B9%D9%86_%D8%A7%D9%84%D8%BA%D9%8A%D8%B1',
                      src: 'دار الافتاء المصريه'),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  faqCard(
                      context: context,
                      questionTitle: 'حكم هبة ثواب الأعمال للأقرباء وغيرهم',
                      answer: """
فقد رجحنا في فتاوى كثيرة أن من عمل عملاً ووهب ثوابه للميت وصله ذلك الثواب، أياً ما كان هذا العمل. 
  أنه قد جاء عن النبى -صلى الله عليه وسلم- ما يدل على جواز الحج عن الغير، حتى من غير الولد، فعن ابن عباس- رضي الله عنهما- أن النبى -صلى الله عليه وسلم- سمع رجلا يقول: لبيك عن شبرمة. قال: {من شبرمة}؟، قال: أخ لي، أو قريب لي. قال: {حججت عن نفسك}؟ قال: لا. قال: {حج عن نفسك، ثم حج عن شبرمة} 
""",
                      siteUrl:
                          'https://www.islamweb.net/ar/fatwa/121173/%D8%AD%D9%83%D9%85-%D9%87%D8%A8%D8%A9-%D8%AB%D9%88%D8%A7%D8%A8-%D8%A7%D9%84%D8%A3%D8%B9%D9%85%D8%A7%D9%84-%D9%84%D9%84%D8%A3%D9%82%D8%B1%D8%A8%D8%A7%D8%A1-%D9%88%D8%BA%D9%8A%D8%B1%D9%87%D9%85',
                      src: 'اسلام ويب'),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  faqCard(
                      context: context,
                      questionTitle: 'هل يجوز أداء عمرة واحدة لأكثر من متوفى؟',
                      answer: 'راجع الفيديو الموجود في المصدر.',
                      siteUrl: 'https://www.youtube.com/watch?v=CCsAAv-HOQ8',
                      src: 'دار الافتاء المصريه'),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  faqCard(
                    context: context,
                    siteUrl: 'https://www.youtube.com/watch?v=61hubV2jMbw',
                    questionTitle:
                        ' حكم العمرة عن شخص ميت؟!! الشيخ ابن عثيمين ',
                    answer: 'راجع الفيديو الموجود في المصدر',
                    src: '  الشيخ محمد بن صالح العثيمين',
                  ),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  faqCard(
                      context: context,
                      questionTitle:
                          '	حكم إشراك أكثر من واحد في العمرة، والتشريك في ثوابها ',
                      answer: """
  فلا حرج في النيابة في العمرة عن الغير بشرط أن يكون المعتمر قد أدى العمرة عن نفسه، وأن يكون المنوب عنه ميتا، أو يكون حيا عاجزا بدنيا، وأن يأذن له في ذلك، فإذا تحقق ما ذكرنا فلك القيام بعمرة نيابة عن أم صديقك، لكن لا يصح أن تشرك معها أحدا في العمرة، قال ابن قدامة في المغني: فإن استنابه اثنان في نسك فأحرم به عنهما وقع عن نفسه دونهما، لأنه لا يمكن وقوعه عنهما، فهذا الكلام يدل على أنه لا يصح الاشتراك في إحرام بنسك واحد. انتهى. 

أما اعتمارك عن نفسك عمرة نافلة، وإشراك غيرك في ثوابها فهذا قد أجازه كثير من العلماء، وليس لذلك عدد معين، سواء كان من تشركهم في الثواب أحياء أم ميتين.

قال الشيخ العثيمين رحمه الله: والتشريك في الثواب لا حصر له، فها هو النبي صلّى الله عليه وسلّم ضحى عن كل أمته، وها هو الرجل يضحي بالشاة الواحدة عنه وعن أهل بيته، ولو كانوا مائة. انتهى.

والله أعلم.
                        """,
                      siteUrl:
                          'https://www.islamweb.net/ar/fatwa/376810/%D8%AD%D9%83%D9%85-%D8%A5%D8%B4%D8%B1%D8%A7%D9%83-%D8%A3%D9%83%D8%AB%D8%B1-%D9%85%D9%86-%D9%88%D8%A7%D8%AD%D8%AF-%D9%81%D9%8A-%D8%A7%D9%84%D8%B9%D9%85%D8%B1%D8%A9%D8%8C-%D9%88%D8%A7%D9%84%D8%AA%D8%B4%D8%B1%D9%8A%D9%83-%D9%81%D9%8A-%D8%AB%D9%88%D8%A7%D8%A8%D9%87%D8%A7',
                      src: 'اسلام ويب'),
                ],
              ),
            ]),
          )),
    );
  }
}

//////////////////////////
///
Card faqCard(
    {String questionTitle,
    String answer,
    String siteUrl,
    String src,
    BuildContext context}) {
  return Card(
    margin: EdgeInsets.all(3),
    color: Colors.orange,
    child: ExpansionTile(
      onExpansionChanged: (isExpended) {
        if (isExpended) {
          print("Its EXpended");
        } else
          print("Ohhhh,, its Not ");
      },
      title: Text(
        questionTitle,
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontFamily: ArabicFonts.Mada,
          package: 'google_fonts_arabic',
        ),
      ),
      children: <Widget>[
        Text(
          answer,
          // textAlign: ,
          style: TextStyle(
            letterSpacing: .5,
            fontWeight: FontWeight.w600,
            fontFamily: ArabicFonts.Changa,
            package: 'google_fonts_arabic',
          ),
        ),
        InkWell(
          onTap: () async {
            if (await canLaunch(siteUrl)) {
              await launch(siteUrl);
            } else {
              Alert(
                      context: context,
                      type: AlertType.error,
                      title: "حدث خطا اثناء محاولة فتح الرابط",
                      desc:
                          "حدث خطا اثناء محاولة فتح الرابط , يرجي اخبارنا بالمشكله ")
                  .show();
            }
          },
          child: Row(
            children: <Widget>[
              Text(
                "المصدر :- $src",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.redAccent[400],
                  fontWeight: FontWeight.w900,
                  fontFamily: ArabicFonts.Tajawal,
                  package: 'google_fonts_arabic',
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
