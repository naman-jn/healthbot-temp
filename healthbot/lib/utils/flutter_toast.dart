import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healthbot/styles/app_colors.dart';

void toast({required String text, bool isLong = true}) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: isLong ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: AppColors.brown600,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
