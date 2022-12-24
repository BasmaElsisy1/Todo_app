import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/modules/List/edittask.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:todo_application/modules/List/edittask.dart';
// import 'package:todo_application/shared/components/ui_utilities.dart';
import '../../models/task.dart';
import '../../providers/myProvider.dart';
import '../../shared/network/local/firebase_utils.dart';
import '../../shared/styles/colors.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskItem extends StatefulWidget {
  Task task;
  TaskItem(this.task);
  DateTime selectedDate = DateTime.now();
  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 33, vertical: 10),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 1 / 2,
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                deleteTasksFromFireStore(widget.task.id);
              },
              icon: Icons.delete,
              label: AppLocalizations.of(context)!.delete,
              backgroundColor: redColor,
              autoClose: true,
              borderRadius: provider.language == "ar"
                  ? BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15))
                  : BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15)),
            ),
            SlidableAction(
              onPressed: (context) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => editScreen(
                      task: widget.task,
                    ),
                  ),
                );
              },
              icon: Icons.edit,
              label: AppLocalizations.of(context)!.edit,
              backgroundColor: blueColor,
              spacing: 0.0,
              autoClose: true,
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 27),
          decoration: BoxDecoration(
              color: provider.themeMode ==
          ThemeMode.dark? Color.fromRGBO(35, 37, 50, 0.4196078431372549) : Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 4,
                    height: 60,
                    margin: provider.language == "ar"
                        ? EdgeInsets.only(left: 25)
                        : EdgeInsets.only(right: 25),
                    decoration: BoxDecoration(
                        color:
                            widget.task.isDone == true ? greenColor : blueColor,
                        borderRadius: BorderRadius.circular(3)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.task.title,
                        style: TextStyle(
                            color: widget.task.isDone == true
                                ? greenColor
                                : blueColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Text(
                        '${widget.selectedDate.day} / ${widget.selectedDate.month} / ${widget.selectedDate.year}',
                        style: TextStyle(
                            color: widget.task.isDone == true
                                ? greenColor
                                : blueColor,
                            fontSize: 12,
                            fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                ],
              ),
              InkWell(
                onTap: () async {
                  return await ChangeDone(widget.task.id);
                },
                child: widget.task.isDone == true
                    ? Text(
                        AppLocalizations.of(context)!.done,
                        style: TextStyle(
                            color: greenColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      )
                    : Container(
                        width: 70,
                        height: 35,
                        decoration: BoxDecoration(
                            color: blueColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
