import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:olgoo_mobile/config/routing/routes.dart';
import 'package:olgoo_mobile/config/theme/color_pallet.dart';
import 'package:olgoo_mobile/config/theme/theme_data.dart';
import 'package:olgoo_mobile/core/dependency_injection/locator.dart';

import 'features/presentation/profile/bloc/company.bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await locatorSetup();
  //? define system chrome for whole app
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: ColorPallet.lightColorScheme.onSecondary,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => CompanyBloc(locator()),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routs,
      title: 'Flutter Demo',
      theme: lightThemeData,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa'), // farsi
      ],
    );
  }
}
