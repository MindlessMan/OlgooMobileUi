import 'package:go_router/go_router.dart';
import 'package:olgoo_mobile/core/utils/main_wrapper.dart';
import 'package:olgoo_mobile/features/presentation/admin_configuration/screens/owner_configuration.screen.dart';
import 'package:olgoo_mobile/features/presentation/authentication/screens/login.screen.dart';
import 'package:olgoo_mobile/features/presentation/authentication/screens/otp.screen.dart';
import 'package:olgoo_mobile/features/presentation/authentication/screens/signup.screen.dart';
import 'package:olgoo_mobile/features/presentation/dashboard/screen/dashboard.screen.dart';
import 'package:olgoo_mobile/features/presentation/intro/screens/free_trial.screen.dart';
import 'package:olgoo_mobile/features/presentation/intro/screens/onboarding.screen.dart';
import 'package:olgoo_mobile/features/presentation/profile/screens/profile.screen.dart';
import 'package:olgoo_mobile/features/presentation/orders/screens/orders.dart';

import '../../features/presentation/product/screens/add_product.screen.dart';

final GoRouter routs = GoRouter(initialLocation: "/splash", routes: [
  GoRoute(
    path: '/splash',
    name: "/splash",
    builder: (context, state) => const FreeTrialScreen(),
  ),
  GoRoute(
    path: '/onboarding',
    name: "/onboarding",
    builder: (context, state) => const OnBoardingScreen(),
  ),
  GoRoute(
    path: '/login',
    name: "/login",
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: '/signup',
    name: "/signup",
    builder: (context, state) => SignupScreen(),
  ),
  GoRoute(
    path: '/config',
    name: "/config",
    builder: (context, state) => const SetupConfigureScreen(),
  ),
  GoRoute(
    path: '/addOrder',
    name: "/addOrder",
    builder: (context, state) => const ProductRegistrationPage(),
  ),
  GoRoute(
    path: '/dashboard',
    name: "/dashboard",
    builder: (context, state) => const DashboardScreen(),
  ),
  GoRoute(
      path: '/otp',
      name: "/otp",
      builder: (context, state) {
        final String userPhoneNumber = state.extra as String;
        return OtpScreen(
          userPhoneNumeber: userPhoneNumber,
        );
      }),
  GoRoute(
      path: '/management',
      name: "/management",
      builder: (context, state) => const ProfileScreen()),
  GoRoute(
      path: '/orders',
      name: "/orders",
      builder: (context, state) => const OrdersScreen()),
  GoRoute(
      path: '/mainWrapper',
      name: "/mainWrapper",
      builder: (context, state) => const MainWrapper()),
]);
