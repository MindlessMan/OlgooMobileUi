import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:olgoo_mobile/config/asset/strings.dart';
import 'package:olgoo_mobile/config/asset/svg_path.dart';
import 'package:olgoo_mobile/config/theme/color_pallet.dart';
import 'package:olgoo_mobile/config/theme/measure.dart';
import 'package:olgoo_mobile/config/theme/text_styles.dart';
import 'package:olgoo_mobile/core/widgets/primary_button.dart';
import 'package:olgoo_mobile/core/widgets/secondary_text_button.dart';
import 'package:olgoo_mobile/features/presentation/intro/widgets/buy_subscription.widgets.dart';

class BuySubscriptionScreen extends StatelessWidget {
  const BuySubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: Measures.extraLargePadding),
                child: Text(
                  StringConsts.olgooSubscription,
                  style: lightTextTheme.displayLarge,
                ),
              ),
              const Text(StringConsts.freeTrialOver),
              Padding(
                padding: EdgeInsets.only(top: Measures.extraLargePadding),
                child: SvgPicture.asset(
                  SvgPath.logoOutline,
                  width: 128,
                  height: 128,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: Measures.extraLargePadding,
                  left: Measures.largePadding,
                  right: Measures.largePadding,
                ),
                child: const BuySubscriptionItem(
                  title: StringConsts.oneMonth,
                  price: 299,
                  isSelected: false,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: Measures.mediumPadding,
                  left: Measures.largePadding,
                  right: Measures.largePadding,
                ),
                child: const BuySubscriptionItem(
                  title: StringConsts.threeMonth,
                  prevPrice: 689,
                  price: 555,
                  isSelected: true,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: Measures.mediumPadding,
                ),
                child: const Text(
                  StringConsts.noWorries,
                ),
              ),
              const Spacer(),
              PrimaryButton(
                isPrimaryColor: true,
                action: () {},
                child: Text(
                  StringConsts.buyOlgooSubscription,
                  style: lightTextTheme.titleMedium!.copyWith(
                    color: ColorPallet.lightColorScheme.onSecondary,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: Measures.smallerLargePadding,
                ),
                child: SecondaryTextButton(
                  onPressed: () {},
                  child: const Text(
                    StringConsts.needAsistance,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
