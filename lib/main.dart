import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/home/My_themes.dart';
import 'package:islamic_app/home/hadeeth_Details.dart';
import 'package:islamic_app/home/home.dart';
import 'package:islamic_app/home/providers/my_provider.dart';
import 'package:islamic_app/home/providers/surag_details_provider.dart';
import 'package:provider/provider.dart';

import 'Surah_ Details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(

    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MyProvider()),
        ChangeNotifierProvider(create: (context) => SuraDetailsProvider()),
      ],
      child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        // <-- change the path of the translation files
        child: const MyApp(),
        saveLocale: true,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context)..getTheme();
    provider.getTheme();
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      themeMode: provider.mode,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: Home_Screen.routeName,
      routes: {
        Home_Screen.routeName: (context) => Home_Screen(),
        Surah_Details.routeName: (context) => Surah_Details(),
        HadeethDetailsScreen.routeName: (context) => HadeethDetailsScreen()
      },
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
