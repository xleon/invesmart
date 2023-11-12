import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import 'app_colors.dart';
import 'app_typography.dart';

class AppTheme extends InheritedWidget {
  final AppThemeData data;

  const AppTheme({
    super.key,
    required this.data,
    required super.child,
  });

  static AppThemeData of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    return widget!.data;
  }

  @override
  bool updateShouldNotify(covariant AppTheme oldWidget) {
    return data != oldWidget.data;
  }
}

class AppThemeData extends Equatable {
  const AppThemeData({
    required this.isDark,
    required this.typography,
  });

  AppColorsData get pockitColors => isDark //
      ? AppColorsData.dark()
      : AppColorsData.light();

  final AppTypographyData typography;
  final bool isDark;

  @override
  List<Object?> get props => [isDark, typography];
}

ThemeData parentTheme = ThemeData(
  useMaterial3: false,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

ThemeData lightTheme = parentTheme.copyWith(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
  ),
);

ThemeData darkTheme = lightTheme.copyWith(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
  ),
);

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  AppColorsData get pockitColors => AppTheme.of(this).pockitColors;
  AppTypographyData get typography => AppTheme.of(this).typography;
}
