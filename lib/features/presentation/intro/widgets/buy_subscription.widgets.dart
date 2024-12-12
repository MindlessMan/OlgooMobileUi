import 'package:flutter/material.dart';
import 'package:olgoo_mobile/config/asset/img_path.dart';
import 'package:olgoo_mobile/config/asset/strings.dart';
import 'package:olgoo_mobile/config/theme/color_pallet.dart';
import 'package:olgoo_mobile/config/theme/measure.dart';
import 'package:olgoo_mobile/config/theme/text_styles.dart';

class BuySubscriptionItem extends StatelessWidget {
  const BuySubscriptionItem({
    super.key,
    required this.title,
    this.description = 'توضیحات',
    required this.price,
    required this.isSelected,
    this.prevPrice,
  });
  final String title;
  final String description;
  final double price;
  final double? prevPrice;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    double discountAmount = 0;
    if (prevPrice != null) {
      final double diffrence = prevPrice! - price;
      discountAmount = (diffrence / prevPrice!) * 100;
    }
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: Measures.smallerMediumPadding,
          horizontal: Measures.smallerMediumPadding),
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorPallet.lightColorScheme.secondary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(
          Measures.extraSmallBorderRadius,
        ),
        border: Border.all(
          width: 1,
          color: ColorPallet.lightColorScheme.secondary.withOpacity(0.56),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          if (prevPrice != null)
            Positioned(
              top: -20,
              left: -20,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: ColorPallet.lightColorScheme.secondary,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    ImgPath.star,
                  ),
                ),
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Transform.scale(
                scale: 1.2,
                child: Radio<bool>(
                  value: true,
                  groupValue: isSelected,
                  onChanged: (_) {},
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: lightTextTheme.displayMedium,
                  ),
                  Text(
                    prevPrice != null
                        ? '${discountAmount.toStringAsFixed(0)}% ${StringConsts.discount}'
                        : description,
                    style: prevPrice != null
                        ? lightTextTheme.bodySmall!.copyWith(
                            color: ColorPallet.lightColorScheme.error,
                          )
                        : lightTextTheme.bodySmall,
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (prevPrice != null)
                    Text(
                      prevPrice!.toStringAsFixed(0),
                      style: lightTextTheme.bodyMedium!
                          .copyWith(decoration: TextDecoration.lineThrough),
                    ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: price.toStringAsFixed(0),
                          style: lightTextTheme.titleLarge!.copyWith(height: 1),
                        ),
                        TextSpan(
                          text: ' ${StringConsts.currency}',
                          style: lightTextTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
