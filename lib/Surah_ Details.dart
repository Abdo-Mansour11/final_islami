import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/home/My_themes.dart';
import 'package:islamic_app/home/providers/my_provider.dart';
import 'package:islamic_app/home/providers/surag_details_provider.dart';
import 'package:islamic_app/sura_model.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart';
import 'package:quran/quran_text.dart';

class Surah_Details extends StatelessWidget {
  const Surah_Details({super.key});

  static const String routeName = "suradetails";

  @override

  Widget build(BuildContext context) {

    var pro = Provider.of<MyProvider>(context);
    var model = ModalRoute.of(context)?.settings.arguments as SuraModel;

    return ChangeNotifierProvider(
      create: (context) => SuraDetailsProvider()..loadSuraFile(model.index),
      builder: (context, child) {
        var suraProv = Provider.of<SuraDetailsProvider>(context);

      return Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              pro.mode == ThemeMode.light
                  ? "assets/images/default_bg.png"
                  : "assets/images/dark_bg.png",
              fit: BoxFit.fill,
            ),
          ),
          Scaffold(
            appBar: AppBar(
              title: Text(
                model.name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              centerTitle: true,
            ),
            body: Card(
              margin: EdgeInsets.all(12),
              color: pro.mode == ThemeMode.light
                  ? Colors.white.withOpacity(0.55)
                  : Color(0xff0f0f0f)..withOpacity(0.55),
              elevation: 4,
              shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text(
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        "${suraProv.verses[index].trim()} ${getVerseEndSymbol(index + 1)}",
                        
                        style: GoogleFonts.amiri(
                            fontSize: 25, fontWeight: FontWeight.w400),
                      ),
                    );
                  },
                  itemCount: suraProv.verses.length,
                ),
              ),
            ),
          ),
        ],
      );
      },
    );
  }
}
