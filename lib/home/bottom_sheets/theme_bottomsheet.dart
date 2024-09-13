import 'package:flutter/material.dart';
import 'package:islamic_app/home/My_themes.dart';
import 'package:islamic_app/home/providers/my_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomsheet extends StatelessWidget {
  const ThemeBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyProvider>(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                prov.changeTheme(ThemeMode.light);
              },
              child: Container(
                height: 50,
                child: prov.mode == ThemeMode.light
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Light",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: primaryColor),
                          ),
                          Icon(
                            Icons.done,
                            color: primaryColor,
                            size: 30,
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Light",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: blackColor),
                          ),
                        ],
                      ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                prov.changeTheme(ThemeMode.dark);
              },
              child: Container(
                height: 50,
                child:prov.mode == ThemeMode.dark
              ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dark",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: primaryColor),
                  ),
                  Icon(
                    Icons.done,
                    color: primaryColor,
                    size: 30,
                  ),
                ],
              )
                  : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dark",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: blackColor),
                ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
