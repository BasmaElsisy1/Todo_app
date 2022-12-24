// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/modules/List/task_item.dart';
// import 'package:todo_application/modules/List/task_item.dart';
// import 'package:todo_application/shared/network/local/firebase_utils.dart';
import '../../models/task.dart';
import '../../providers/myProvider.dart';
import '../../shared/network/local/firebase_utils.dart';
import '../../shared/styles/colors.dart';

class ListScreen extends StatefulWidget {
  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: date,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (dateTime) {
              date = dateTime;
              setState(() {

              });
            },
            leftMargin: 20,
            dayNameColor: provider.themeMode == ThemeMode.dark? Colors.white: blackColor,
            monthColor: provider.themeMode == ThemeMode.dark? Colors.white: blackColor,
            dayColor: provider.themeMode == ThemeMode.dark? Colors.white: blackColor,
            activeDayColor: blueColor,
            activeBackgroundDayColor: provider.themeMode == ThemeMode.dark? blackColor: Colors.white,
            dotsColor: Colors.transparent,
            selectableDayPredicate: (date) => true,
            locale: 'en',
            showYears: false,
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot<Task>>(
              stream: getDataFromFireStore(date),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('There is an error'));
                }
                var tasks = snapshot.data?.docs.map((e) => e.data()).toList();
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return TaskItem(tasks![index]);
                  },
                  itemCount: tasks?.length ?? 0,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
