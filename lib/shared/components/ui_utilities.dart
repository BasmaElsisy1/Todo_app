import 'package:flutter/material.dart';
import '../styles/colors.dart';

showLoading(String message, BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Center(
          child: AlertDialog(
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircularProgressIndicator(
                    color: blackColor,
                  ),
                  Text(
                    message,
                    style: TextStyle(fontSize: 20),
                  )
                ],
              )
            ],
          ),
        );
      });
}

showMessage(String message, BuildContext context, String positivetext,
    VoidCallback positiveActionButton,
    {String? negativetext, VoidCallback? negativeActionButton}) {
  showDialog(
      context: context,
      builder: (context) {
        List<Widget> actions = [
          TextButton(
            onPressed: positiveActionButton,
            child: Text(positivetext),
          )
        ];
        if (negativetext != null) {
          actions.add(TextButton(
            onPressed: negativeActionButton,
            child: Text(negativetext),
          ));
        }
        return AlertDialog(
          title: Text(message),
          actions: actions,
        );
      });
}

hideLoading(BuildContext context) {
  Navigator.pop(context);
}
