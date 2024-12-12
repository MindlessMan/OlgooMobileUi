import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:olgoo_mobile/config/asset/strings.dart';
import 'package:olgoo_mobile/config/asset/svg_path.dart';
import 'package:olgoo_mobile/core/widgets/secondary_outlined_button.dart';
import 'package:olgoo_mobile/features/presentation/profile/bloc/company.bloc.dart';
import 'package:olgoo_mobile/features/presentation/profile/bloc/company.status.dart';
import 'package:olgoo_mobile/features/presentation/profile/widgets/profile.widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CompanyBloc>(context).add(FetchCompany());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(
          StringConsts.systemManagement,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: Stack(
          children: [
            // Scrollable content
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<CompanyBloc, CompanyState>(
                    builder: (context, state) {
                      if (state.status is FetchedCompanyStatus) {
                        var data = (state.status as FetchedCompanyStatus).data;
                        return UserInfoCard(
                          userName: translator(data.title),
                          subscriptionStatus: translator(data.status),
                          daysRemaining: 83,
                        );
                      } else if (state.status is LoadingCompanyStatus) {
                        return UserInfoCard(
                          userName: translator("Not Registered !"),
                          subscriptionStatus: StringConsts.waiting,
                          daysRemaining: 0,
                        );
                      } else {
                        return const UserInfoCard(
                          userName: StringConsts.error,
                          subscriptionStatus: StringConsts.error,
                          daysRemaining: 0,
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 24),
                  const ItemsArea(
                    items: [
                      ProfileItem(
                          iconPath: SvgPath.box,
                          title: StringConsts.manageProducts),
                      ItemDivider(),
                      ProfileItem(
                          iconPath: SvgPath.tag,
                          title: StringConsts.manageCategories),
                      ItemDivider(),
                      ProfileItem(
                          iconPath: SvgPath.profile,
                          title: StringConsts.systemUsers),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const ItemsArea(
                    items: [
                      ProfileItem(
                          iconPath: SvgPath.videoPlay,
                          title: StringConsts.howToWorkWithSystem),
                      ItemDivider(),
                      ProfileItem(
                          iconPath: SvgPath.securitySafe,
                          title: StringConsts.privacy),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SupportButton(),
                    SecondaryOutlinedButton(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(StringConsts.informationExport),
                          const SizedBox(width: 8),
                          SvgPicture.asset(
                            SvgPath.documentDownload,
                            height: 20.0,
                            width: 20.0,
                          ),
                        ],
                      ),
                      onClick: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  translator(String txt) {
    switch (txt) {
      case "active":
        return StringConsts.active;
      case "Not Registered !":
        return StringConsts.deactive;
      default:
        return StringConsts.subscription;
    }
  }
}
