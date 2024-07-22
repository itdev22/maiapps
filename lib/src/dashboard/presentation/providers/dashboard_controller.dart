import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gufytea/core/common/app/providers/tab_navigator.dart';
import 'package:gufytea/core/common/views/presistent_view.dart';
import 'package:gufytea/core/services/injection_container.dart';
import 'package:gufytea/src/basket/presentation/cubit/basket_cubit.dart';
import 'package:gufytea/src/basket/presentation/views/basket_view.dart';
import 'package:gufytea/src/home/presentation/cubit/food_cubit.dart';
import 'package:gufytea/src/home/presentation/view/home_view.dart';
import 'package:gufytea/src/profile/presentation/cubit/profile_cubit.dart';
import 'package:gufytea/src/profile/presentation/views/profile_view.dart';
import 'package:provider/provider.dart';

class DashboardController extends ChangeNotifier {
  List<int> _indexHistory = [0];
  late List<Widget> _screens;

  DashboardController() {
    _initializePrefs();
  }

  Future<void> _initializePrefs() async {
    _screens = _buildScreens();
    notifyListeners(); // Ensure UI updates when prefs are loaded
  }

  List<Widget> _buildScreens() {
    return [
      ChangeNotifierProvider(
        create: (_) => TabNavigator(
          TabItem(
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (_) => sl<FoodCubit>(),
                ),
              ],
              child: const HomeView(),
            ),
          ),
        ),
        child: const PersistentView(),
      ),
      ChangeNotifierProvider(
        create: (_) => TabNavigator(
          TabItem(
            child: BlocProvider(
              create: (context) => sl<BasketCubit>(),
              child: const BasketView(),
            ),
          ),
        ),
        child: const PersistentView(),
      ),
      ChangeNotifierProvider(
        create: (_) => TabNavigator(
          TabItem(
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (_) => sl<ProfileCubit>(),
                ),
              ],
              child: const ProfileView(),
            ),
          ),
        ),
        child: const PersistentView(),
      ),
    ];
  }

  List<Widget> get screens => _screens;
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void changeIndex(int index) {
    if (_currentIndex == index) return;
    _currentIndex = index;
    _indexHistory.add(index);
    notifyListeners();
  }

  void resetIndex() {
    _indexHistory = [0];
    _currentIndex = 0;
    notifyListeners();
  }

  void reinitialize() async {
    _indexHistory = [0];
    _currentIndex = 0;
    _screens = _buildScreens();
    notifyListeners();
  }
}
