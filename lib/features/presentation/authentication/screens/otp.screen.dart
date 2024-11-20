import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:olgoo_mobile/config/extensions/gap_space_extension.dart';
import 'package:olgoo_mobile/core/dependency_injection/locator.dart';
import 'package:olgoo_mobile/core/widgets/primary_button.dart';
import 'package:olgoo_mobile/core/widgets/snackbar.dart';
import 'package:olgoo_mobile/features/domain/auth/entity/user.entity.dart';
import 'package:olgoo_mobile/features/presentation/authentication/bloc/auth/auth_bloc_bloc.dart';
import 'package:olgoo_mobile/features/presentation/authentication/bloc/auth/auth_status.dart';
import 'package:pinput/pinput.dart';
import '../../../../config/asset/icons_path.dart';
import '../../../../config/asset/svg_path.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({
    super.key,
    required this.userPhoneNumeber,
  });
  final String userPhoneNumeber;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  Timer? _timer;
  int _start = 180; // 3 minutes in seconds
  bool _canResend = false;

  TextEditingController pinController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  String get timerText {
    int minutes = _start ~/ 60;
    int seconds = _start % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void startTimer() {
    setState(() {
      _canResend = false;
    });
    _canResend = false; // Disable resend button initially
    _start = 180; // Reset the timer to 3 minutes

    _timer?.cancel(); // If there's already a running timer, cancel it.
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_start > 0) {
          _start--;
        } else {
          _canResend = true; // Enable resend button when timer ends
          _timer?.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(locator()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //! Header ---------------------------------------------------------
              SvgPicture.asset(SvgPath.message),
              Text(
                  "کد فعالسازی به شماره ی ${widget.userPhoneNumeber} ارسال شد"),
              //! text button for changing number
              TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        IconPath.edit,
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.primary,
                            BlendMode.srcIn),
                      ),
                      4.0.horizontalSpace,
                      Text(
                        "ویرایش شماره",
                        style: TextStyle(
                            fontFamily: "dana",
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.primary),
                      )
                    ],
                  )),
              (MediaQuery.of(context).size.height * 0.1).verticalSpace,
              //! pin put --------------------------------------------------------
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (mounted) {
                    if (state.status is ErrorAuthStatus) {
                      SnackBars.errorSnackBar(context, "به مشکلی بر خوردیم",
                          (state.status as ErrorAuthStatus).errorMessage);
                    } else if (state.status is SuccessAuthStatus) {
                      UserEntity user =
                          (state.status as SuccessAuthStatus).user;
                      SnackBars.successSnackBar(
                          context,
                          "${user.name} جان خوش اومدی",
                          "احراز هویت با موفقیت انجام شد");
                    }
                  }
                },
                builder: (context, state) {
                  return Pinput(
                    controller: pinController,
                    key: globalKey,
                    // validator: (value) {
                    //   //
                    // },
                    onSubmitted: (value) {
                      //todo call event
                      BlocProvider.of<AuthBloc>(context).add(VerifyOtpEvent(
                          code: pinController.text,
                          phoneNumber: widget.userPhoneNumeber));
                    },
                    pinAnimationType: PinAnimationType.slide,
                    length: 5,

                    errorPinTheme: PinTheme(
                        textStyle: TextStyle(
                            fontFamily: "dana",
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.error),
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Theme.of(context).colorScheme.error))),
                    errorTextStyle: TextStyle(
                        fontFamily: "dana",
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.error),
                    defaultPinTheme: PinTheme(
                        textStyle: TextStyle(
                            fontFamily: "dana",
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer),
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Theme.of(context).colorScheme.outline))),
                  );
                },
              ),
              14.0.verticalSpace,
              //!send again button -----------------------------------------------
              TextButton(
                  onPressed: () {
                    if (_canResend) {
                      startTimer();
                      BlocProvider.of<AuthBloc>(context)
                          .add(SendOtpEvent(widget.userPhoneNumeber));
                    }
                  },
                  child: _canResend
                      ? Text(
                          "دریافت نکردید؟ ارسال مجدد",
                          style: TextStyle(
                              fontFamily: "dana",
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.primary),
                        )
                      : Text(
                          'دریافت نکردید؟ $timerText تا ارسال مجدد',
                          style: TextStyle(
                              fontFamily: "dana",
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(context).colorScheme.surfaceBright),
                        )),
              (MediaQuery.of(context).size.height * 0.28).verticalSpace,
              //! action button --------------------------------------------------
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state.status is SuccessAuthStatus) {
                    if ((state.status as SuccessAuthStatus).user.status ==
                        "not registered") {
                      context.goNamed(
                        "/signup",
                        extra: widget.userPhoneNumeber,
                      );
                    } else if ((state.status as SuccessAuthStatus)
                            .user
                            .status ==
                        "deactive") {
                    } else {
                      context.goNamed(
                        "/config",
                      );
                    }
                  }
                },
                builder: (context, state) {
                  return PrimaryButton(
                      isPrimaryColor: true,
                      action: () {
                        BlocProvider.of<AuthBloc>(context).add(VerifyOtpEvent(
                            code: pinController.text,
                            phoneNumber: widget.userPhoneNumeber));
                      },
                      child: state.status is LoadingAuthStatus
                          ? SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 3.0,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ))
                          : Text(
                              "ورود",
                              style: Theme.of(context).textTheme.labelLarge,
                            ));
                },
              ),
              25.0.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
