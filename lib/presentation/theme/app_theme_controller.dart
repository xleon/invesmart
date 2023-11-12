import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_theme_controller.g.dart';

@Riverpod(keepAlive: true)
class SelectedThemeMode extends _$SelectedThemeMode {
  @override
  ThemeMode build() => ThemeMode.light;

  void toggle() {
    state = state == ThemeMode.light //
        ? ThemeMode.dark
        : ThemeMode.light;
  }
}
