import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/home/My_themes.dart';
import 'package:islamic_app/home/providers/my_provider.dart';
import 'package:provider/provider.dart';

class SebhaTap extends StatefulWidget {
   SebhaTap({super.key});

  @override
  State<SebhaTap> createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap> {

  int counter =0;
  int currentIndex =0;
  double routationAngle =0;
  List<String> tasbeehText=['سبحان الله','الحمد لله','الله اكبر'];
   void tesbeehCount(){
    setState(() {
      counter++;
      routationAngle+= -28.76 * pi / 180;
      if(counter==33){
        counter=0;
        currentIndex=(currentIndex+1) %tasbeehText.length;
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            GestureDetector(
              onTap: () {
               tesbeehCount();
              },
              child: Container(
                margin: EdgeInsets.only(top: 106),
                child: Transform.rotate(
                  angle: routationAngle,
                  child: GestureDetector(
                    onTap: () {
                      tesbeehCount();

                    },
                    child: Image.asset(
                      prov.mode == ThemeMode.light?
                      'assets/images/body_sebha_logo.png'
                      :"assets/images/body_sebha_dark.png"
                      ,
                      height:234 ,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 28,left: 45),
              child: Image.asset(
                prov.mode == ThemeMode.light?
                'assets/images/head_sebha_logo.png'
                    :"assets/images/head_sebha_dark.png",
                height:105 ,
              ),
            ),

          ],
        ),
        SizedBox(height: 60,),
        Center(child: Text("Number of praises".tr(), style: GoogleFonts.elMessiri(fontSize: 25 , fontWeight: FontWeight.w600),)),

        SizedBox(height: 40,),
        Container(
          width: 69,
          height: 90,
          margin: EdgeInsets.only(left: 190,right: 190),
          decoration: BoxDecoration(
              color:  prov.mode == ThemeMode.light?
                    primaryColor
                    :primaryDarkColor,
              borderRadius: BorderRadius.circular(25)
          ),
          child: Center(
            child: Text("$counter",style: GoogleFonts.inter(
              fontWeight: FontWeight.w400,
              fontSize: 25,

            ),),
          ),
        ),
        SizedBox(height: 20,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 150),
          child: ElevatedButton(onPressed:tesbeehCount, style: ElevatedButton.styleFrom(
              padding:EdgeInsets.symmetric(horizontal: 15,vertical: 10) ,
              backgroundColor:
              prov.mode == ThemeMode.light?
              primaryColor
              :yellowColor,
          ), child:Text(tasbeehText[currentIndex],style: GoogleFonts.inter(
              fontSize: 25,
              fontWeight: FontWeight.w400,
              color: Colors.white
          ),
          ) ),
        ),





      ],
    );
  }
}
