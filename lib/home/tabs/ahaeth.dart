import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/hadeeth%20model.dart';
import 'package:islamic_app/home/hadeeth_Details.dart';

class AhadeethTab extends StatefulWidget {
   AhadeethTab({super.key});

  @override
  State<AhadeethTab> createState() => _AhadeethTabState();
}

class _AhadeethTabState extends State<AhadeethTab> {
List<Hadeethmodel> allAhadeth = [];

  @override
  Widget build(BuildContext context) {
    if(allAhadeth.isEmpty) {
      loadHadethFile();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset("assets/images/hadeth_logo.png" , height: 219,),
        Divider(
          thickness: 3,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ahadeth".tr(),style:
            Theme.of(context).textTheme.bodySmall
            ),
          ],
        ),
        Divider(
          thickness: 3,
        ),

        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, HadeethDetailsScreen.routeName,
                    arguments: allAhadeth[index]);

                  },
                  child: Text(
                    textAlign: TextAlign.center,
                      allAhadeth[index].title,
                    style: GoogleFonts.elMessiri(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  
                  ),
                ) ;
              },
            itemCount: allAhadeth.length,

          ),
        )




      ],
    );
  }

  loadHadethFile(){
     rootBundle.loadString("assets/hadeeth_file/ahadeth.txt") .then((value){
      List<String> ahadeth = value.split("#");
      for(int i=0 ; i< ahadeth.length ; i++) {
        String hadethverse = ahadeth[i];
        List<String> hadethLines = hadethverse.trim().split("\n");
        String title = hadethLines[0];
        hadethLines.removeAt(0);
        List<String> hadethContent = hadethLines;

        Hadeethmodel hadeethmodel = Hadeethmodel(title, hadethContent);
        allAhadeth.add(hadeethmodel);
        print(hadeethmodel.title);
      }
      setState(() {

      });
    });
  }
}
