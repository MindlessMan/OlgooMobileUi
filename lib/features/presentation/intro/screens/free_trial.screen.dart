import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:olgoo_mobile/config/asset/strings.dart';
import 'package:olgoo_mobile/config/asset/svg_path.dart';
import 'package:olgoo_mobile/config/theme/color_pallet.dart';
import 'package:olgoo_mobile/config/theme/measure.dart';
import 'package:olgoo_mobile/config/theme/text_styles.dart';
import 'package:olgoo_mobile/core/widgets/primary_button.dart';
import 'package:olgoo_mobile/core/widgets/secondary_text_button.dart';
import 'package:olgoo_mobile/features/presentation/intro/widgets/free_trial.wigets.dart';

class FreeTrialScreen extends StatelessWidget {
  const FreeTrialScreen({super.key});

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
                  StringConsts.discoverForFree,
                  style: lightTextTheme.displayLarge,
                ),
              ),
              const Text(StringConsts.discoverForFreeDescription),
              Padding(
                padding: EdgeInsets.only(top: Measures.extraLargePadding),
                child: SvgPicture.asset(
                  SvgPath.gift,
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
                child: const FreeTrialCard(),
              ),
              const Spacer(),
              PrimaryButton(
                isPrimaryColor: true,
                action: () {},
                child: Text(
                  StringConsts.getFreeTrial,
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
