import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void setStatusBarIconsColor({bool dark = true}) {
  // make the android status bar transparent and set dark/light icons
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: dark ? Brightness.light : Brightness.light,
    ),
  );
}
