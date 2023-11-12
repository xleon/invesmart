import 'dart:ui';

import 'package:equatable/equatable.dart';

class AppColorsData extends Equatable {
  final Color? primary;

  const AppColorsData({
    this.primary,
  });

  factory AppColorsData.light() => AppColorsData(
        primary: const Color(0xFF6200EE),
      );

  factory AppColorsData.dark() => AppColorsData(
        primary: const Color(0xFFBB86FC),
      );

  @override
  List<Object?> get props => [primary];
}
