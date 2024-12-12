import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:olgoo_mobile/config/asset/strings.dart';
import 'package:olgoo_mobile/config/asset/svg_path.dart';
import 'package:olgoo_mobile/config/theme/color_pallet.dart';
import 'package:olgoo_mobile/config/theme/measure.dart';
import 'package:olgoo_mobile/config/theme/theme_data.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ItemsArea extends StatelessWidget {
  const ItemsArea({
    super.key,
    required this.items,
  });

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
      decoration: BoxDecoration(
        color: ColorPallet.lightColorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(
          Measures.extraSmallBorderRadius,
        ),
      ),
      child: Column(
        children: items,
      ),
    );
  }
}

class ItemDivider extends StatelessWidget {
  const ItemDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Divider(),
    );
  }
}

class SupportButton extends StatelessWidget {
  const SupportButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: lightThemeData.colorScheme.secondary,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              color: const Color.fromARGB(255, 54, 124, 255).withOpacity(0.32),
              offset: const Offset(0, 14),
              spreadRadius: 1,
              blurRadius: 14)
        ],
      ),
      child: Center(
        child: SvgPicture.asset(
          SvgPath.callCalling,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}

class UserInfoCard extends StatelessWidget {
  final String userName;
  final String subscriptionStatus;
  final int daysRemaining;

  const UserInfoCard({
    super.key,
    required this.userName,
    required this.subscriptionStatus,
    required this.daysRemaining,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(Measures.extraSmallBorderRadius),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 30,
                child: SvgPicture.asset(
                  SvgPath.avatar,
                  height: 36.0,
                  width: 36.0,
                ),
              ),
              Positioned(
                bottom: -1,
                right: -1,
                width: 28,
                height: 28,
                child: IconButton(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                    backgroundColor: ColorPallet.lightColorScheme.primary,
                    foregroundColor: ColorPallet.lightColorScheme.onPrimary,
                  ),
                  icon: SvgPicture.asset(
                    SvgPath.edit,
                    height: 24.0,
                    width: 24.0,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      subscriptionStatus,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Icon(
                      Icons.circle,
                      size: 8,
                      color: Colors.green,
                    ),
                  ],
                ),
              ],
            ),
          ),
          CircularPercentIndicator(
            radius: 36.0,
            animation: true,
            animationDuration: 1200,
            lineWidth: 3.0,
            percent: 0.4,
            center: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  daysRemaining.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: ColorPallet.lightColorScheme.onPrimaryContainer,
                  ),
                ),
                const Text(
                  StringConsts.daysRemaining,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            circularStrokeCap: CircularStrokeCap.butt,
            //add to colors
            backgroundColor: Colors.black.withOpacity(0.12),
            progressColor: ColorPallet.lightColorScheme.primary,
          ),
          SizedBox(
            width: Measures.smallSpace,
          ),
          const Icon(
            Icons.keyboard_arrow_down,
          ),
        ],
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.iconPath,
    required this.title,
  });

  final String iconPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          iconPath,
          height: 36.0,
          width: 36.0,
          colorFilter: ColorFilter.mode(
            ColorPallet.lightColorScheme.secondary,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: ColorPallet.lightColorScheme.onSecondary,
            shape: BoxShape.circle,
            border: Border.all(
              width: 0.5,
              color: Colors.black.withOpacity(0.12),
            ),
          ),
          padding: EdgeInsets.all(Measures.extraSmallPadding),
          child: const Center(
            child: Icon(
              Icons.arrow_forward_ios,
              size: 12,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
