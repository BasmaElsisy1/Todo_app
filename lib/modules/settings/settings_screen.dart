import 'package:flutter/material.dart';
// import 'package:todo_application/modules/settings/theme.dart';
import 'package:todoapp/modules/settings/theme.dart';
import '../../providers/myProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../shared/styles/colors.dart';
import 'language.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);

    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: pro.themeMode == ThemeMode.light
                      ? blackColor
                      : Colors.white,
                ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(16),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(color: blueColor),
                color: pro.themeMode == ThemeMode.light
                    ? Colors.white
                    : blackColor,
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/arrow.png'),
                  alignment: pro.language == "en"
                      ? Alignment(0.9, 0.1)
                      : Alignment(-0.9, 0.1),
                )),
            child: InkWell(
                onTap: () {
                  return showLanguageSheet(context);
                },
                child: Text(
                    pro.language == "ar"
                        ? AppLocalizations.of(context)!.arabic
                        : AppLocalizations.of(context)!.english,
                    style: TextStyle(
                        fontSize: 14, color: blueColor))),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            AppLocalizations.of(context)!.theme_mode,
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: pro.themeMode == ThemeMode.light
                      ? blackColor
                      : Colors.white,
                ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(16),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: blueColor),
                color: pro.themeMode == ThemeMode.light
                    ? Colors.white
                    : blackColor,
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/arrow.png'),
                  alignment: pro.language == "en"
                      ? Alignment(0.9, 0.1)
                      : Alignment(-0.9, 0.1),
                )),
            child: InkWell(
              onTap: () {
                return showThemeOptions(context);
              },
              child: Text(
                pro.themeMode == ThemeMode.light
                    ? AppLocalizations.of(context)!.light
                    : AppLocalizations.of(context)!.dark,
                style: TextStyle(fontSize: 14, color: blueColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (c) {
          return Language_sheet();
        });
  }

  void showThemeOptions(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (c) {
          return ThemeOptions();
        });
  }
}
