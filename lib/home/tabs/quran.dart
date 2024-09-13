import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/Surah_%20Details.dart';
import 'package:islamic_app/home/My_themes.dart';
import 'package:islamic_app/home/providers/my_provider.dart';
import 'package:islamic_app/sura_model.dart';
import 'package:provider/provider.dart';

class QuranTab extends StatelessWidget {
   QuranTab({super.key});

   List <String> suwar =["الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
  ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
  ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
  ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
  ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
  ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
  ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
  ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
  ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
  "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"];
   List<int> versesNumber = [7,286,200,176,120,165,206,75,129,109,123,111,43,52,99,128,111,110,98,135,112,78,118,64,77,227,93,88,
     69,60,34,30,73,54,45,83,182,88,75,85,54,53,89,59,37,35,38,29,18,45,60,49,62,55,78,96,29,22,24,13,14,11,11,18,12,12,30,52,52,
     44,28,28,20,56,40,31,50,40,46,42,29,19,36,25,22,17,19,26,30,20,15,21,11,8,5,19,5,8,8,11,11,8,3,9,5,4,6,3,6,3,5,4,5,6
   ];

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          'assets/images/qur2an_screen_logo.png',
          height: 227,
        ),

      Expanded(
        child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: ListView.builder(

                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Surah_Details.routeName,
                        arguments: SuraModel(suwar[index], index)
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 70),
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              width: 100,
                              child: Text('${versesNumber[index]}' ,style: GoogleFonts.amiri(
                                fontSize: 24,
                              ),),
                            ),
                          ),
                          SizedBox(width: 140,),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              width: 100,
                              child: Text( suwar[index] ,style: GoogleFonts.inder(
                                fontSize: 24,
                              ),),
                            ),
                          ),

                        ],
                      ),
                    ),
                  );
                }, itemCount: 114,
            ),
          ),

          Padding(
            padding:  EdgeInsets.symmetric(vertical: 40),
            child: Divider(
              thickness: 3,
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(vertical: 9 , horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "verses".tr(),style: GoogleFonts.elMessiri(
                  fontSize: 25,
                  fontWeight: FontWeight.w600
                ),
                ),

                SizedBox(width:1 ,),
                Text(
                  "sura_name".tr(),style: GoogleFonts.elMessiri(
                    fontSize: 25,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 3,
          ),
          Center(
            child:
            Container(
              padding: EdgeInsets.only(top: 8),
              height: double.infinity,
              child: VerticalDivider(
                thickness:5 ,
                width: 50,
                color:
                prov.mode == ThemeMode.light?
                primaryColor
                :yellowColor,
              ),
            ),
          ),

        ],
        ),
      ),

      ]
    );
  }
}