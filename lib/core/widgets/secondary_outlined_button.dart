import 'package:flutter/material.dart';
import 'package:olgoo_mobile/config/theme/color_pallet.dart';
import 'package:olgoo_mobile/config/theme/measure.dart';
import 'package:olgoo_mobile/config/theme/text_styles.dart';

class SecondaryOutlinedButton extends StatelessWidget {
  const SecondaryOutlinedButton({
    super.key,
    required this.child,
    required this.onClick,
  });
  final Widget child;
  final void Function() onClick;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: ColorPallet.lightColorScheme.secondary,
        textStyle: lightTextTheme.bodySmall,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Measures.extraSmallBorderRadius,
          ),
        ),
        side: BorderSide(
          width: 1,
          color: ColorPallet.lightColorScheme.secondary.withOpacity(
            0.56,
          ),
        ),
      ),
      child: child,
    );
  }
}
