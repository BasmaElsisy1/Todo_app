// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:todo_application/shared/network/local/firebase_utils.dart';
//
// import '../../providers/myProvider.dart';
// import '../../shared/styles/colors.dart';
//
// class editScreen extends StatelessWidget {
//
//
//   static const String routename = 'edit';
//   var titleController = TextEditingController();
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     var pro = Provider.of<MyProvider>(context);
//     return Scaffold(
//       backgroundColor:
//           pro.themeMode == ThemeMode.light ? mintColor : blackColor,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(160),
//         child: AppBar(
//
//           title: Container(
//               padding: EdgeInsets.only(left: 50),
//               child: Text(
//
//                 'To Do List',
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               )),
//           centerTitle: false,
//         ),
//       ),
//       body: Container(
//         color: Colors.white,
//         child: Column(children: [
//           Text('Edit Task')
//           ,SizedBox(height: 30,),
//           Form(
//               key: formKey,
//               child: TextFormField(
//                 validator: (text) {
//                   if (text != null && text.isEmpty) {
//                     return 'Please write task title';
//                   }
//                   return null;
//                 },
//                 controller: titleController,
//                 decoration: InputDecoration(
//                   hintText: 'This is title',
//                   hintStyle: TextStyle(
//                       fontSize: 20,
//                       color: blackColor,
//                       fontWeight: FontWeight.bold),
//                   border: UnderlineInputBorder(
//                     borderSide: BorderSide(color: blackColor, width: 2),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: blackColor, width: 2),
//                   ),
//                 ),
//                 style: TextStyle(color: blackColor),
//               )),
//
//           InkWell(
//             onTap: (){
//               // Edit(id, title)
//             },
//             child: Container(
//             child: Text('Save'),
//           ),)
//
//         ],),
//       ),
//     );
//   }
// }
