import 'package:flutter/material.dart';
import 'package:olgoo_mobile/config/theme/color_pallet.dart';

TextTheme lightTextTheme = TextTheme(
  //! title
  displayLarge: TextStyle(
    fontFamily: "dana",
    fontSize: 24,
    color: ColorPallet.lightColorScheme.onSurface,
    fontWeight: FontWeight.w700,
  ),
  displayMedium: TextStyle(
    fontFamily: "dana",
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ColorPallet.lightColorScheme.onSurface,
  ),
  displaySmall: TextStyle(
    fontFamily: "dana",
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: ColorPallet.lightColorScheme.onSurface,
  ),
  titleLarge: TextStyle(
    fontFamily: "dana",
    fontSize: 18,
    color: ColorPallet.lightColorScheme.onSurface,
    fontWeight: FontWeight.w800,
  ),

  titleMedium: TextStyle(
    fontFamily: "dana",
    fontSize: 16,
    color: ColorPallet.lightColorScheme.onSurface,
    fontWeight: FontWeight.w700,
  ),
  titleSmall: TextStyle(
    fontFamily: "dana",
    fontSize: 14,
    color: ColorPallet.lightColorScheme.onSurface,
    fontWeight: FontWeight.w500,
  ),

//! label
  labelLarge: TextStyle(
    fontFamily: "dana",
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: ColorPallet.lightColorScheme.onPrimary,
  ),
//! body
  bodyMedium: TextStyle(
    fontFamily: "dana",
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: ColorPallet.lightColorScheme.surfaceBright,
  ),

  bodySmall: TextStyle(
    fontFamily: "dana",
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: ColorPallet.lightColorScheme.surfaceBright,
  ),
);
