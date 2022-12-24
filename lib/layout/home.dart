import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../modules/List/showAddTask.dart';
import '../shared/styles/colors.dart';
import '../../providers/myProvider.dart';
import '../modules/List/list_screen.dart';
import '../modules/settings/settings_screen.dart';
import '../shared/styles/colors.dart';

class HomePage extends StatefulWidget {
  static const String routename = 'Home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int current_index = 0;
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Scaffold(
      backgroundColor:
          pro.themeMode == ThemeMode.light ? mintColor : blackColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(160),
        child: AppBar(
          title: Container(
              padding: EdgeInsets.only(left: 50),
              child: Text(
                current_index == 1
                    ? AppLocalizations.of(context)!.settings
                    : AppLocalizations.of(context)!.appBarText,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: pro.themeMode == ThemeMode.dark
                        ? blackColor
                        : Colors.white),
              )),
          centerTitle: false,
        ),
      ),
      body: screen[current_index],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          type: BottomNavigationBarType.fixed,
          currentIndex: current_index,
          onTap: (index) {
            current_index = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                backgroundColor: pro.themeMode == ThemeMode.light
                    ? Colors.white
                    : blackColor,
                icon: Icon(
                  Icons.list_rounded,
                  size: 40,
                ),
                label: ''),
            BottomNavigationBarItem(
              backgroundColor:
                  pro.themeMode == ThemeMode.light ? Colors.white : blackColor,
              icon: ImageIcon(
                AssetImage('assets/images/icon-settings.png'),
                size: 30,
              ),
              label: '',
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return showBottomAddTask();
        },
        child: Icon(Icons.add),
        shape: StadiumBorder(
            side: BorderSide(
                color:
                    pro.themeMode == ThemeMode.dark ? blackColor : Colors.white,
                width: 5)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  List<Widget> screen = [
    ListScreen(),
    SettingsScreen(),
  ];
  void showBottomAddTask() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        context: context,
        builder: (c) {
          return Container(
              height: MediaQuery.of(context).size.height * 0.40,
              child: AddTask());
        });
  }
}
