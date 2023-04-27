import 'dart:async';
import 'dart:developer';

import 'package:crybse/app/observers.dart';
import 'package:crybse/app/providers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
    ),
  );

  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  var container = ProviderContainer(
    overrides: [],
    observers: [
      Observers(),
    ],
  );
  container = await initializeProviders(container);

  await runZonedGuarded(
    () async => runApp(
      EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('es')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: UncontrolledProviderScope(
          container: container,
          child: await builder(),
        ),
      ),
    ),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
