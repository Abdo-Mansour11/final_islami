import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/home/My_themes.dart';
import 'package:islamic_app/home/bottom_sheets/language_bottomsheet.dart';
import 'package:islamic_app/home/My_themes.dart';
import 'package:islamic_app/home/bottom_sheets/theme_bottomsheet.dart';
import 'package:islamic_app/home/providers/my_provider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("theme".tr()),
          SizedBox(
            height: 18,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                backgroundColor: Colors.white,
                context: context,
                builder: (context) {
                  return ThemeBottomsheet();
                },
              );
            },
            child: Container(
              padding: EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color: prov.mode == ThemeMode.light
                        ? primaryColor
                        : yellowColor,
                  )),
              child:prov.mode == ThemeMode.light?
              Text("light".tr()):
              Text("dark".tr())
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text("language".tr()),
          SizedBox(
            height: 18,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.white,
                context: context,
                builder: (context) {
                  return LanguageBottomsheet();
                },
              );
            },
            child: Container(
              padding: EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all( color: prov.mode == ThemeMode.light
                      ? primaryColor
                      : yellowColor,),),
              child:
                    Text("arabic".tr()),
            ),
          )
        ],
      ),
    );
  }
}
