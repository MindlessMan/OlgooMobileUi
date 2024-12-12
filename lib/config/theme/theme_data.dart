import 'package:flutter/material.dart';
import 'package:olgoo_mobile/config/theme/color_pallet.dart';
import 'package:olgoo_mobile/config/theme/text_styles.dart';

ThemeData lightThemeData = ThemeData(
    colorScheme: ColorPallet.lightColorScheme,
    textTheme: lightTextTheme,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    //BottomNavigationBar styles in material 3 :
    navigationBarTheme: NavigationBarThemeData(
      labelTextStyle: WidgetStateProperty.all(
        lightTextTheme.bodyMedium,
      ),
      surfaceTintColor: ColorPallet.lightColorScheme.surfaceBright,
    ),
    //Divider styles :
    dividerTheme: DividerThemeData(
      color: ColorPallet.lightColorScheme.onPrimaryFixed,
    ));
