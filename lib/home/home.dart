import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/home/My_themes.dart';
import 'package:islamic_app/home/providers/my_provider.dart';
import 'package:islamic_app/home/tabs/ahaeth.dart';
import 'package:islamic_app/home/tabs/quran.dart';
import 'package:islamic_app/home/tabs/radio.dart';
import 'package:islamic_app/home/tabs/sebha.dart';
import 'package:islamic_app/home/tabs/setting.dart';
import 'package:provider/provider.dart';

class Home_Screen extends StatefulWidget {
   Home_Screen({super.key});

  static const String routeName = "Home_Screen";

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyProvider>(context);
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            prov.mode == ThemeMode.light?
            "assets/images/default_bg.png":
            "assets/images/dark_bg.png"
            ,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Scaffold(
          appBar: AppBar(
            elevation: null,
            title: Text(
              'islami'.tr(),
              style:Theme.of(context) . textTheme.bodyLarge?. copyWith(
               fontSize: 40
              ),
            ),
            centerTitle: true,
          ),

          body: tabs[selectedIndex],

          bottomNavigationBar:BottomNavigationBar(
            currentIndex:selectedIndex ,
            onTap: (value) {
              selectedIndex=value;
              setState(() {

              });
            },

            items: [
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/icon_quran.png')),label: "قرأن",backgroundColor:prov.mode == ThemeMode.light?primaryColor : primaryDarkColor),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/icon_hadeth.png')),label: "أحاديث",backgroundColor:prov.mode == ThemeMode.light?primaryColor : primaryDarkColor),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/icon_sebha.png')),label: "مسبحة",backgroundColor:prov.mode == ThemeMode.light?primaryColor : primaryDarkColor),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/icon_radio.png')),label: "صوتيات",backgroundColor:prov.mode == ThemeMode.light?primaryColor : primaryDarkColor),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: "اعدادات",backgroundColor:prov.mode == ThemeMode.light?primaryColor : primaryDarkColor),
          ],),
        ),
      ],
    );
  }
  List<Widget> tabs = [
    QuranTab(),
    AhadeethTab(),
    SebhaTap(),
    RadioTap(),
    SettingsTab()
  ];
}
