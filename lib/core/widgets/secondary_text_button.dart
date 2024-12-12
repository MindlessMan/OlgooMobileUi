import 'package:flutter/material.dart';
import 'package:olgoo_mobile/config/theme/color_pallet.dart';

class SecondaryTextButton extends StatelessWidget {
  const SecondaryTextButton(
      {super.key, required this.onPressed, required this.child});
  final void Function() onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: ColorPallet.lightColorScheme.secondary,
      ),
      child: child,
    );
  }
}
