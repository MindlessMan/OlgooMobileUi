import 'package:flutter/material.dart';
import 'package:olgoo_mobile/config/theme/color_pallet.dart';
import 'package:toastification/toastification.dart';

class SnackBars {
  static successSnackBar(
      BuildContext context, String title, String decription) {
    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.flatColored,
 title: Text(
        title,
        style: TextStyle(
            fontFamily: "dana",
            color: ColorPallet.lightColorScheme.onSurface,
            fontSize: 14,
            fontWeight: FontWeight.w600),
      ),
      description: Text(decription,style: TextStyle(
            fontFamily: "dana",
            color: ColorPallet.lightColorScheme.onSurface,
            fontSize: 12,
            fontWeight: FontWeight.w400),),
      alignment: Alignment.bottomCenter,
      autoCloseDuration: const Duration(seconds: 4),
      primaryColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.surface,
      backgroundColor: Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(12.0),
      direction: TextDirection.rtl,
    );
  }

  static errorSnackBar(BuildContext context, String title, String decription) {
    toastification.show(
      context: context,
      type: ToastificationType.error,
      style: ToastificationStyle.flatColored,
      title: Text(
        title,
        style: TextStyle(
            fontFamily: "dana",
            color: ColorPallet.lightColorScheme.onSurface,
            fontSize: 14,
            fontWeight: FontWeight.w600),
      ),
      description: Text(decription,style: TextStyle(
            fontFamily: "dana",
            color: ColorPallet.lightColorScheme.onSurface,
            fontSize: 12,
            fontWeight: FontWeight.w400),),
      alignment: Alignment.bottomCenter,
      autoCloseDuration: const Duration(seconds: 4),
      primaryColor: Theme.of(context).colorScheme.error,
      foregroundColor: Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(12.0),
      backgroundColor: Theme.of(context).colorScheme.surface,
      direction: TextDirection.rtl,
    );
  }
}
