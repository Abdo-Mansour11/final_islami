import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/hadeeth%20model.dart';
import 'package:islamic_app/home/providers/my_provider.dart';
import 'package:provider/provider.dart';

class HadeethDetailsScreen extends StatelessWidget {
  const HadeethDetailsScreen({super.key});

  static const String routeName = 'HadethD';

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    var model = ModalRoute.of(context)?.settings.arguments as Hadeethmodel;
    List<String> spl = [];
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  pro.mode == ThemeMode.light?
              "assets/images/default_bg.png"
                  :"assets/images/dark_bg.png"
              ),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            model.title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(18),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Text(
                " ${model.Content[index]}\n ",
                textDirection: TextDirection.rtl,
                style: GoogleFonts.elMessiri(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              );
            },
            itemCount: model.Content.length,
          ),
        ),
      ),
    );
  }
}
