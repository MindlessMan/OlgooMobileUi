import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:olgoo_mobile/config/extensions/gap_space_extension.dart';
import 'package:olgoo_mobile/core/dependency_injection/locator.dart';
import 'package:olgoo_mobile/core/widgets/primary_button.dart';
import 'package:olgoo_mobile/core/widgets/snackbar.dart';
import 'package:olgoo_mobile/features/domain/auth/usecase/auth.usecase.dart';
import 'package:olgoo_mobile/features/presentation/authentication/bloc/auth/auth_bloc_bloc.dart';
import 'package:olgoo_mobile/features/presentation/authentication/bloc/auth/auth_status.dart';
import '../../../../config/asset/icons_path.dart';
import '../../../../config/asset/strings.dart';
import '../../../../config/asset/svg_path.dart';
import '../../../../core/widgets/primary_textbox.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(locator<AuthUseCases>()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              (MediaQuery.of(context).size.height * 0.12).verticalSpace,
              //! Logo------------------------------------------------------------
              DelayedWidget(
                  animationDuration: const Duration(milliseconds: 400),
                  delayDuration: const Duration(milliseconds: 400),
                  animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
                  child: SvgPicture.asset(
                    SvgPath.logo,
                    height: 100,
                    width: 100,
                  )),
              //! welcomoing texts------------------------------------------------
              // header
              DelayedWidget(
                animationDuration: const Duration(milliseconds: 400),
                delayDuration: const Duration(milliseconds: 800),
                animation: DelayedAnimations.SLIDE_FROM_RIGHT,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 10),
                  child: Text(
                    StringConsts.loginHeader,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              //subheader
              DelayedWidget(
                animationDuration: const Duration(milliseconds: 400),
                delayDuration: const Duration(milliseconds: 1100),
                animation: DelayedAnimations.SLIDE_FROM_RIGHT,
                child: Text(
                  StringConsts.loginSubTexts,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              (MediaQuery.of(context).size.height * 0.07).verticalSpace,
              //! text field container--------------------------------------------
              DelayedWidget(
                animationDuration: const Duration(milliseconds: 400),
                delayDuration: const Duration(milliseconds: 1100),
                child: PrimaryTextBox(
                    controller: phoneNumberController,
                    iconPath: IconPath.call,
                    title: " شماره تلفن خود را وارد کنید",
                    hint: "*********09"),
              ),
              (MediaQuery.of(context).size.height * 0.34).verticalSpace,
              //! apply button----------------------------------------------------
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  // success status
                  if (mounted) {
                    if (state.status is NeedOTPStatus) {
                      context.goNamed("/otp",
                          extra: phoneNumberController.text);
                    } else if (state.status is ErrorAuthStatus) {
                      String msg =
                          (state.status as ErrorAuthStatus).errorMessage;
                      SnackBars.errorSnackBar(
                          context, "یه مشکلی پیش اومده", msg);
                    }
                  }
                  // error status
                },
                builder: (context, state) {
                  return DelayedWidget(
                    animationDuration: const Duration(milliseconds: 400),
                    delayDuration: const Duration(milliseconds: 1100),
                    animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
                    child: PrimaryButton(
                        action: () {
                          BlocProvider.of<AuthBloc>(context)
                              .add(SendOtpEvent(phoneNumberController.text));
                        },
                        isPrimaryColor: true,
                        child: state.status is LoadingAuthStatus
                            ? SizedBox(
                                height: 16,
                                width: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 3.0,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              )
                            : Text(
                                StringConsts.loginButton,
                                style: Theme.of(context).textTheme.labelLarge,
                              )),
                  );
                },
              ),
              //! options-------------------------------------------------
              DelayedWidget(
                  animationDuration: const Duration(milliseconds: 400),
                  delayDuration: const Duration(milliseconds: 800),
                  animation: DelayedAnimations.SLIDE_FROM_RIGHT,
                  child: TextButton(
                    onPressed: () {
                      //todo navigate to support page
                      context.goNamed("/signup");
                    },
                    child: Text(
                      StringConsts.loginSignupOption,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "dana",
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.surfaceBright),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
