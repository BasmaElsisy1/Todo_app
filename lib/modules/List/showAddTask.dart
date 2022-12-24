import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:todo_app/models/task.dart';
// import 'package:todo_app/shared/network/local/firebase_utils.dart';
import '../../../providers/myProvider.dart';
import '../../models/task.dart';
import '../../shared/components/ui_utilities.dart';
import '../../shared/network/local/firebase_utils.dart';
import '../../shared/styles/colors.dart';

class AddTask extends StatefulWidget {
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var titleController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 21, horizontal: 44),
      color: provider.themeMode == ThemeMode.dark ? blackColor : Colors.white,
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.addNewTask,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: provider.themeMode == ThemeMode.dark
                    ? Colors.white
                    : blackColor),
          ),
          SizedBox(
            height: 40,
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
                  hintText: AppLocalizations.of(context)!.addNewTask_hint,
                  hintStyle: TextStyle(
                      fontSize: 20,
                      color: graylightColor,
                      fontWeight: FontWeight.bold),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: provider.themeMode == ThemeMode.dark
                            ? Colors.white
                            : blackColor,
                        width: 5),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: provider.themeMode == ThemeMode.dark
                            ? Colors.white
                            : blackColor,
                        width: 2),
                  ),
                ),
                style: TextStyle(
                    color: provider.themeMode == ThemeMode.dark
                        ? Colors.white
                        : blackColor),
              )),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              SelectDate();
            },
            child: Text(
              '${selectedDate.day} / ${selectedDate.month} / ${selectedDate.year}',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: provider.themeMode == ThemeMode.dark
                      ? Colors.white
                      : blackColor),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          InkWell(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  Task task = Task(
                    title: titleController.text,
                    date:
                        DateUtils.dateOnly(selectedDate).microsecondsSinceEpoch,
                  );

                  showLoading(AppLocalizations.of(context)!.loading, context);
                  addTaskToFireStore(task).then((value) {
                    hideLoading(context);
                    showMessage(
                        AppLocalizations.of(context)!.successfull_message,
                        context,
                        AppLocalizations.of(context)!.okay, () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    });
                  }).catchError((error) {});
                }
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: provider.themeMode ==
                        ThemeMode.dark? blackColor : Colors.white, width: 5)),
                child: Icon(
                  Icons.done_outlined,
                  color: Colors.white,
                  size: 40,
                ),
              ))
        ],
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
