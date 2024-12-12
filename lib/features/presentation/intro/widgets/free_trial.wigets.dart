import 'package:flutter/material.dart';
import 'package:olgoo_mobile/config/asset/strings.dart';
import 'package:olgoo_mobile/config/theme/color_pallet.dart';
import 'package:olgoo_mobile/config/theme/measure.dart';
import 'package:olgoo_mobile/config/theme/text_styles.dart';

class FreeTrialCard extends StatelessWidget {
  const FreeTrialCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: Measures.mediumPadding, horizontal: Measures.largePadding),
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorPallet.lightColorScheme.secondary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(
          Measures.largeBorderRadius,
        ),
        border: Border.all(
          width: 1,
          color: ColorPallet.lightColorScheme.secondary.withOpacity(0.56),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringConsts.ourGuest,
            style: lightTextTheme.displaySmall,
          ),
          Text(
            StringConsts.useAllFacilities,
            style: lightTextTheme.titleSmall,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Measures.mediumPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: Measures.extraSmallPadding,
                  ),
                  child: const FreeTrialRow(
                    text: StringConsts.instantSupport,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: Measures.extraSmallPadding,
                  ),
                  child: const FreeTrialRow(
                    text: StringConsts.threeRealtimeUsers,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: Measures.extraSmallPadding,
                  ),
                  child: const FreeTrialRow(
                    text: StringConsts.fastStatistics,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ItemCircle extends StatelessWidget {
  const ItemCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Measures.smallSize,
      height: Measures.smallSize,
      decoration: BoxDecoration(
        color: ColorPallet.lightColorScheme.secondary,
        shape: BoxShape.circle,
      ),
    );
  }
}

class FreeTrialRow extends StatelessWidget {
  const FreeTrialRow({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ItemCircle(),
        SizedBox(
          width: Measures.smallPadding,
        ),
        Text(
          text,
          style: lightTextTheme.titleSmall,
        ),
      ],
    );
  }
}
