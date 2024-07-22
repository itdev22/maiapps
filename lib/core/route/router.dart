import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gufytea/core/route/arguments.dart';
import 'package:gufytea/core/services/injection_container.dart';
import 'package:gufytea/src/dashboard/presentation/view/dashboard.dart';
import 'package:gufytea/src/food_detail/presentation/cubit/food_detail_cubit.dart';
import 'package:gufytea/src/food_detail/presentation/views/food_detail_screen.dart';
import 'package:gufytea/src/on_boarding/presentation/views/on_boarding_screen.dart';
import 'package:gufytea/src/page_under_constructuion.dart/presentation/views/page_under_constructio_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return _pageBuilder(
        (_) => const OnBoardingScreen(),
        settings: settings,
      );
    case Dashboard.routeName:
      return _pageBuilder(
        (_) => const Dashboard(),
        settings: settings,
      );
    case FoodDetailScreen.routeName:
      final args = settings.arguments as FoodDetailArguments;
      return _pageBuilder(
        (context) {
          return BlocProvider(
            create: (_) => sl<FoodDetailCubit>(),
            child: FoodDetailScreen(
              entity: args.entity,
            ),
          );
        },
        settings: settings,
      );
    default:
      return _pageBuilder(
        (_) => const PageUnderConstrutionScreen(),
        settings: settings,
      );
  }
}

PageRouteBuilder<dynamic> _pageBuilder(
  Widget Function(BuildContext) page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
    pageBuilder: (context, _, __) => page(context),
  );
}
