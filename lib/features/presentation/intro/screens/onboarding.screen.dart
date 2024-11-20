import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:olgoo_mobile/config/extensions/gap_space_extension.dart';
import 'package:olgoo_mobile/core/dependency_injection/locator.dart';
import 'package:olgoo_mobile/core/utils/preferences_oprator.dart';
import 'package:olgoo_mobile/core/widgets/primary_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../config/asset/svg_path.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController(initialPage: 0);
  PreferencesOprator _preferencesOprator = PreferencesOprator(locator());
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 0.28,
          child: Center(
            child: PageView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  index = value;
                });
              },
              children: const [
                OnBoardingDataWidgets(
                    svgName: SvgPath.chart2,
                    title: "آمارگیری دقیق و سریع",
                    description: "آمارگیری از محصولات و سفارشات در هر لحظه"),
                OnBoardingDataWidgets(
                    svgName: SvgPath.clipboard,
                    title: "مدیریت سفارش ها",
                    description: "سفارش ها بر اساس دسته بندی مرتب شدن"),
                OnBoardingDataWidgets(
                    svgName: SvgPath.message,
                    title: "اطلاع رسانی خودکار به مشتری",
                    description: "امکان مدیریت پیام های ارسالی به مشتریان"),
              ],
            ),
          ),
        ),
        SmoothPageIndicator(
          controller: controller, // PageController
          count: 3,
          axisDirection: Axis.horizontal,
          effect: WormEffect(
              activeDotColor: Theme.of(context).colorScheme.primary,
              type: WormType.thin,
              dotWidth: 12,
              dotHeight: 12), // your preferred effect
        ),
        (MediaQuery.of(context).size.height * 0.27).verticalSpace,
        PrimaryButton(
            isPrimaryColor: true,
            action: () {
              if (index != 2) {
                setState(() {
                  controller.nextPage(
                      duration: Durations.extralong1, curve: Curves.easeInOut);
                });
              } else {
                _preferencesOprator.userSeenOnboarding();
                context.pushReplacementNamed("/login");
              }
            },
            child: Text(
              index != 2 ? "ادامه" : "بزن بریم",
              style: Theme.of(context).textTheme.labelLarge,
            )),
        (MediaQuery.of(context).size.height * 0.038).verticalSpace,
      ],
    ));
  }
}

class OnBoardingDataWidgets extends StatelessWidget {
  const OnBoardingDataWidgets(
      {super.key,
      required this.svgName,
      required this.title,
      required this.description});
  final String svgName;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(svgName),
        25.0.verticalSpace,
        Text(
          title,
          style: TextStyle(
              fontFamily: "dana",
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.onPrimaryContainer),
        ),
        10.0.verticalSpace,
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
