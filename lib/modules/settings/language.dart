import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../providers/myProvider.dart';


class Language_sheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      color: Colors.white,
      child: Column(
        children: [
          InkWell(
              onTap: () {
                pro.changeLanguage('en');
                Navigator.pop(context);
              },
              child: LanguageItem(context, AppLocalizations.of(context)!.english,pro.language == 'en')),
          SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {
                pro.changeLanguage('ar');
                Navigator.pop(context);
              },
              child: LanguageItem(context, AppLocalizations.of(context)!.arabic, pro.language == 'ar')),
        ],
      ),
    );
  }

  Widget LanguageItem(BuildContext context, String text, bool isSelected) =>
      Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).colorScheme.secondary
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Icon(
              Icons.done,
              size: (20),
              color: isSelected
                  ? Theme.of(context).colorScheme.onPrimary
                  : Colors.black,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Text(text,
                    style: TextStyle(
                        fontSize: 15,
                        color: isSelected
                            ? Theme.of(context).colorScheme.onPrimary
                            : Colors.black)))
          ],
        ),
      );
}
