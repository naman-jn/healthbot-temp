import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppColors {
  static const white = Colors.white;
  static const brown600 = Colors.black; //  Color(0xff402300);
  static const orange100 = Color(0xffFFECD5);
  static const orange200 = Color(0xffFFD9AA);
  static const orange300 = Color(0xffFFB255);
  static const orange400 = Color(0xffFF8C00);
  static const orange500 = Color(0xff9F5800);
  static const grey200 = Color(0xffEDEDED);
  static const grey300 = Color(0xffE4E4E4);
  static const grey400 = Color(0xffCACACA);
  static const grey500 = Color(0xff989898);
  static const greyShadow = Color(0xffFBFCFB);
  static const blue = Color(0xff1674EA);
  static const green = Color(0xff159947);
  static const red = Color(0xffF2021F);

  //secondary
  static const secondary0 = Color(0x00FDEEEE);
  static const secondary100 = Color(0xffFDEEEE);
  static const secondary200 = Color(0xffFFAAAA);
  static const secondary300 = Color(0xffC35C5C);
  static const secondary400 = Color(0xffE85353);
  static const secondary500 = Color(0xff9F0000);
  static const secondary600 = Color(0xff400000);
}

class AppOverlayStyle {
  static const SystemUiOverlayStyle secondaryNavBarColor = SystemUiOverlayStyle(
    systemNavigationBarColor: AppColors.secondary100,
  );
  static const SystemUiOverlayStyle defaultyNavBarColor = SystemUiOverlayStyle(
    systemNavigationBarColor: AppColors.white,
  );
}
