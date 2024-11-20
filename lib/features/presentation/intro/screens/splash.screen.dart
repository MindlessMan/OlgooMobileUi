import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:olgoo_mobile/config/extensions/gap_space_extension.dart';
import 'package:olgoo_mobile/core/dependency_injection/locator.dart';
import 'package:olgoo_mobile/core/utils/preferences_oprator.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../config/asset/svg_path.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final PreferencesOprator _preferencesOprator = PreferencesOprator(locator());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () => _navigateToNextPage(context),
        child: Column(
          children: [50.0.verticalSpace, _mainUI(context), 10.0.verticalSpace],
        ),
      ),
    );
  }

  _mainUI(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: DelayedWidget(
                animationDuration: Durations.long2,
                animation: DelayedAnimations.SLIDE_FROM_RIGHT,
                child: SvgPicture.asset(
                  SvgPath.logo,
                  width: 100,
                  height: 100,
                )),
          ),
          DelayedWidget(
            delayDuration: const Duration(milliseconds: 700),
            animationDuration: Durations.long2,
            animation: DelayedAnimations.SLIDE_FROM_RIGHT,
            child: Shimmer.fromColors(
              period: Durations.extralong4,
              direction: ShimmerDirection.rtl,
              baseColor: Theme.of(context).colorScheme.onSurface,
              highlightColor: Theme.of(context).colorScheme.surfaceTint,
              child: const Text(
                "الـگو",
                style: TextStyle(
                  fontSize: 100,
                  height: 7,
                  fontFamily: "dana",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _navigateToNextPage(BuildContext context) async {
    if (_preferencesOprator.isUserWatchedOnboarding()) {
      if (_preferencesOprator.getAccToken() != null) {
        print("object");
        context.goNamed('/mainWrapper');
      } else {
        context.goNamed('/login');
      }
    } else {
      context.goNamed('/onboarding');
    }
    //*YES
    // is acc token valid ?
    //* YES
    // go to dashboadr
    //!NO
    //go to authentication
    //!NO
  }
}

// BlocConsumer<SplashCubit, SplashState>(
//   builder: (context, state) {
//     if (state.connectionStatus is InitialConnection ||
//         state.connectionStatus is SuccessConnection) {
//       return const Directionality(
//           textDirection: TextDirection.ltr,
//           child: Text(
//             "OLGOO",
//             style: TextStyle(
//                 fontFamily: 'dana',
//                 fontSize: 16,
//                 fontWeight: FontWeight.w300),
//           ));
//     } else if (state.connectionStatus is FailedConnection) {
//       return Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Text(
//             'به اینترنت متصل نیستید!',
//           ),
//           IconButton(
//               onPressed: () {
//                 /// check that we are online or not
//                 BlocProvider.of<SplashCubit>(context)
//                     .checkConnectionEvent();
//               },
//               icon: SvgPicture.asset(
//                 IconsPath.refresh,
//                 colorFilter: ColorFilter.mode(
//                     Theme.of(context).colorScheme.primary,
//                     BlendMode.srcIn),
//               ))
//         ],
//       );
//     } else {
//       return Container();
//     }
//   },
//   listener: (context, state) {
//     if (state.connectionStatus is SuccessConnection) {
//       _navigateToNextPage(context);
//     }
//   },
// ),
