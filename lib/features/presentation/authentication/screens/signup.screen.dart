import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:olgoo_mobile/config/extensions/gap_space_extension.dart';
import 'package:olgoo_mobile/core/dependency_injection/locator.dart';
import 'package:olgoo_mobile/core/widgets/primary_button.dart';
import 'package:olgoo_mobile/core/widgets/primary_textbox.dart';
import 'package:olgoo_mobile/features/presentation/authentication/bloc/auth/auth_bloc_bloc.dart';
import 'package:olgoo_mobile/features/presentation/authentication/bloc/auth/auth_status.dart';
import '../../../../config/asset/icons_path.dart';
import '../../../../core/widgets/snackbar.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController ownerNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthBloc(locator()),
        child: Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (MediaQuery.of(context).size.height * 0.14).verticalSpace,
                Padding(
                  padding: const EdgeInsets.only(
                    right: 20,
                  ),
                  //! app bar ------------------------------------------------------
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ثبت نام در الگو',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      (MediaQuery.of(context).size.height * 0.013)
                          .verticalSpace,
                      Text(
                        'یک حساب کاربری بسازید و شروع کنید',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                (MediaQuery.of(context).size.height * 0.025).verticalSpace,
                //! forms ------------------------------------------------------------
                PrimaryTextBox(
                    controller: companyNameController,
                    iconPath: IconPath.company,
                    title: "نام تولیدی",
                    hint: "نام تولیدی یا برندتون رو وارد کنید"),
                8.0.verticalSpace,
                PrimaryTextBox(
                    controller: ownerNameController,
                    iconPath: IconPath.profile,
                    title: "نام و نام خانوادگی",
                    hint: "اسم خودتون رو وارد کنید"),
                8.0.verticalSpace,
                (MediaQuery.of(context).size.height * 0.41).verticalSpace,
                //! action button ----------------------------------------------
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state.status is ErrorAuthStatus) {
                      SnackBars.errorSnackBar(context, "یه مشکلی پیش اومده",
                          (state.status as ErrorAuthStatus).errorMessage);
                    } else if (state.status is SuccessRegisterUser) {
                      context.goNamed(
                        "/config",
                      );
                    }
                  },
                  builder: (context, state) {
                    return Center(
                        child: PrimaryButton(
                            action: () {
                              if (state.status is! LoadingAuthStatus) {
                                BlocProvider.of<AuthBloc>(context).add(
                                    RegisterUserEvent(
                                        username: ownerNameController.text,
                                        companyName:
                                            companyNameController.text));
                              }
                            },
                            isPrimaryColor: true,
                            child: state.status is! LoadingAuthStatus
                                ? Text(
                                    "بزن بریم",
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  )
                                : LoadingAnimationWidget.threeArchedCircle(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    size: 30)));
                  },
                ),
                25.0.verticalSpace,
                //! sign up Option ---------------------------------------------------
              ],
            ),
          ),
        ));
  }
}
