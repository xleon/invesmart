import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesmart/i18n/strings.g.dart';
import 'package:invesmart/presentation/theme/theme.dart';

import 'presentation/features/home_page.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(selectedThemeModeProvider);
    final appThemeData = AppThemeData(
      isDark: themeMode == ThemeMode.dark,
      typography: const AppTypographyData(),
    );

    return AppTheme(
        data: appThemeData,
        child: MaterialApp(
          title: t.app.appName,
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          home: const HomePage(),
        ));
  }
}
