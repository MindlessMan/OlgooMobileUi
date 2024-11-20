import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:olgoo_mobile/config/asset/icons_path.dart';
import 'package:olgoo_mobile/config/asset/strings.dart';
import 'package:olgoo_mobile/config/extensions/gap_space_extension.dart';
import 'package:olgoo_mobile/core/widgets/primary_button.dart';

class SetupConfigureScreen extends StatefulWidget {
  const SetupConfigureScreen({super.key});

  @override
  State<SetupConfigureScreen> createState() => _SetupConfigureScreenState();
}

class _SetupConfigureScreenState extends State<SetupConfigureScreen> {


final PageController _pageController = PageController();
double _progress = 0.25;

void _nextPage() {
  setState(() {
    _progress = 0.75;
    _pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          //! linear stepper
          Padding(
            padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
            child: LinearProgressIndicator(
              borderRadius: BorderRadius.circular(10),
              value: _progress,
              backgroundColor: Theme.of(context).colorScheme.outline,
              valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.secondary),
            ),
          ),
          //! pages
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildCategoryPage(),
                _buildProductsPage(),
              ],
            ),
          ),
          //! action button
          PrimaryButton(
              isPrimaryColor: true,
              action: () {
                _nextPage();
              },
              child: Text(
                "بزن بعدی",
                style: Theme.of(context).textTheme.labelLarge,
              )),
          (MediaQuery.of(context).size.height * 0.05).verticalSpace,
        ],
      ),
    );
  }

  Widget _buildCategoryPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          50.0.verticalSpace,
          //! header------------------------------------------------------------
          Row(
            children: [
              SvgPicture.asset(
                IconPath.tag,
                height: 30,
                width: 30,
              ),
              8.0.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConsts.setupGroupHeader,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    StringConsts.setupGroupsubtitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
          //! add group button
          50.0.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "۳ مورد یافت شد",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              InkWell(
                child: Container(
                  padding: const EdgeInsets.all(4),
                  height: 38,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryFixed,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Text(
                    "افزودن گروه",
                    style: Theme.of(context).textTheme.labelLarge,
                  )),
                ),
              )
            ],
          ),
          Divider(
            color: Theme.of(context).colorScheme.outline,
          ),
          //! list
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.43,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(right: 10),
                    margin: const EdgeInsets.only(top: 8),
                    height: 48,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color:
                                      Theme.of(context).colorScheme.secondary)),
                          child: Center(
                            child: SvgPicture.asset(
                              IconPath.tag,
                              width: 16,
                              height: 16,
                              colorFilter: ColorFilter.mode(
                                  Theme.of(context).colorScheme.secondary,
                                  BlendMode.srcIn),
                            ),
                          ),
                        ),
                        5.0.horizontalSpace,
                        const Text(
                          "دبستان خان دایی جون",
                          style: TextStyle(fontFamily: "dana", fontSize: 14),
                        )
                      ],
                    ),
                  );
                }),
          ),
          //! notition
          10.0.verticalSpace,
          Row(
            children: [
              SvgPicture.asset(IconPath.warnning),
              4.0.horizontalSpace,
              Flexible(
                  child: Text(
                "بعدا بازم میتونی هروقت خواستی محصول و گروه اضافه کنی",
                style: TextStyle(
                    fontSize: 13,
                    fontFamily: "dana",
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
              ))
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProductsPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          50.0.verticalSpace,
          //! header------------------------------------------------------------
          Row(
            children: [
              SvgPicture.asset(
                IconPath.product,
                height: 30,
                width: 30,
              ),
              8.0.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConsts.setupProductHeader,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    StringConsts.setupProductsubtitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
          //! add group button
          50.0.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "۳ مورد یافت شد",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              InkWell(
                child: Container(
                  padding: const EdgeInsets.all(4),
                  height: 38,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryFixed,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Text(
                    "افزودن محصول",
                    style: Theme.of(context).textTheme.labelLarge,
                  )),
                ),
              )
            ],
          ),
          Divider(
            color: Theme.of(context).colorScheme.outline,
          ),
          //! list
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.43,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(right: 10, top: 8,left: 8),
                    margin: const EdgeInsets.only(top: 8),
                    height: 55,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color:
                                          Theme.of(context).colorScheme.secondary)),
                              child: Center(
                                child: SvgPicture.asset(
                                  IconPath.placeHolder,
                                  width: 16,
                                  height: 16,
                                  colorFilter: ColorFilter.mode(
                                      Theme.of(context).colorScheme.secondary,
                                      BlendMode.srcIn),
                                ),
                              ),
                            ),
                            5.0.horizontalSpace,
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "پیراهن پسرانه کد ۴۴",
                                  style:
                                      TextStyle(fontFamily: "dana", fontSize: 14),
                                ),
                                Text(
                                  "مدارسی",
                                  style:
                                      TextStyle(fontFamily: "dana", fontSize: 10),
                                ),
                              ],
                            ),
                          ],
                        ),
                         Row(
                          children: [
                            const Text("۳۴۲،۰۰۰",
                                style: TextStyle(
                                    fontFamily: "dana", fontSize: 14)),
                            3.0.horizontalSpace,
                            const Text("تومان",
                                style:
                                    TextStyle(fontFamily: "dana", fontSize: 8)),
                          ],
                        )
                      ],
                    ),
                  );
                }),
          ),
          //! notition
          10.0.verticalSpace,
          Row(
            children: [
              SvgPicture.asset(IconPath.warnning),
              4.0.horizontalSpace,
              Flexible(
                  child: Text(
                "بعدا بازم میتونی هروقت خواستی محصول و گروه اضافه کنی",
                style: TextStyle(
                    fontSize: 13,
                    fontFamily: "dana",
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
              ))
            ],
          )
        ],
      ),
    );
  }

}



