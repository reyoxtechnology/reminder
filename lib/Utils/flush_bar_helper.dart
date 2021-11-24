import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';

Widget alertBar(BuildContext context, String alertMessage, Color backGroundColor, bool? showProgressIndicator, Widget? icon) {
  return Flushbar(
    maxWidth: MediaQuery.of(context).size.width / 1.1,
    progressIndicatorBackgroundColor: AppTheme.white,
    borderRadius: BorderRadius.circular(10),
    dismissDirection: FlushbarDismissDirection.HORIZONTAL,
    icon: icon!,
    showProgressIndicator: showProgressIndicator!,
    message: alertMessage, padding: EdgeInsets.symmetric(horizontal: 20, vertical: 17),
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: backGroundColor,
    duration:  Duration(seconds: 3),
  )..show(context);
}