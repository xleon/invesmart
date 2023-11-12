import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesmart/i18n/strings.g.dart';

import 'app.dart';
import 'infrastructure/infrastructure.dart';
import 'presentation/theme/theme.dart';

void main() async {
  runZonedGuarded(
    () async => await _initApp(),
    (error, stack) {
      // Raygun.sendException(error: error, stackTrace: stack);
      logger.handle(error, stack);
    },
  );
}

Future<void> _initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();

  setStatusBarIconsColor(dark: true);

  final container = ProviderContainer(observers: [ProviderLogger()]);
  // await container.read(packageProvider.notifier).init();
  // container.read(crashTrackerProvider.notifier).init();
  // container.read(mixPanelProvider.notifier).init();

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const App(),
    ),
  );
}
