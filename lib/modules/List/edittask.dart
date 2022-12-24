import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/layout/home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../models/task.dart';
import '../../providers/myProvider.dart';
import '../../shared/network/local/firebase_utils.dart';
import '../../shared/styles/colors.dart';

class editScreen extends StatefulWidget {
  Task task;
  editScreen({required this.task});

  @override
  State<editScreen> createState() => _editScreenState();
}

class _editScreenState extends State<editScreen> {
  var titleController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            pro.themeMode == ThemeMode.light ? mintColor : blackColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(160),
          child: AppBar(
            iconTheme: IconThemeData(
              color: pro.themeMode == ThemeMode.dark
                  ? blackColor
                  : Colors.white, // <-- SEE HERE
            ),
            title: Container(
                padding: EdgeInsets.only(left: 50),
                child: Text(
                  AppLocalizations.of(context)!.appBarText,
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
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: pro.themeMode == ThemeMode.light ? Colors.white : blackColor,
          ),
          child: Column(
            children: [
              Text(
                AppLocalizations.of(context)!.edit_task,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: pro.themeMode == ThemeMode.light
                      ? blackColor
                      : Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              Form(
                  key: formKey,
                  child: TextFormField(
                    validator: (text) {
                      if (text != null && text.isEmpty) {
                        return AppLocalizations.of(context)!.addNewTask_error;
                      }
                      return null;
                    },
                    controller: titleController,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.this_is_title,
                      hintStyle: TextStyle(
                          fontSize: 20,
                          color: pro.themeMode == ThemeMode.light
                              ? blackColor
                              : Colors.white,
                          fontWeight: FontWeight.bold),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: blackColor, width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: blackColor, width: 2),
                      ),
                    ),
                    style: TextStyle(
                      color: pro.themeMode == ThemeMode.light
                          ? blackColor
                          : Colors.white,
                    ),
                  )),
              SizedBox(
                height: 50,
              ),
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  AppLocalizations.of(context)!.select_date,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 20,
                      color: pro.themeMode == ThemeMode.light
                          ? blackColor
                          : Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                onTap: () {
                  SelectDate();
                },
                child: Text(
                  '${selectedDate.day} / ${selectedDate.month} / ${selectedDate.year}',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: graylightColor),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              InkWell(
                onTap: () {
                  Edit(widget.task.id, titleController.text,
                      DateUtils.dateOnly(selectedDate).microsecondsSinceEpoch);
                  setState(() {});
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 70),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: blueColor,
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.save,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void SelectDate() async {
    DateTime? choosenDate = await showDatePicker(
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)),
        context: context);
    if (choosenDate == null) {
      return;
    }
    selectedDate = DateUtils.dateOnly(choosenDate);
    setState(() {});
  }
}
