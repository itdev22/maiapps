import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:maiapps/src/dashboard/presentation/providers/dashboard_controller.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  static const routeName = '/dashboard';

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardController>(
      builder: (_, controller, __) {
        return Scaffold(
          body: IndexedStack(
            index: controller.currentIndex,
            children: controller.screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            backgroundColor: Colors.white,
            elevation: 8,
            onTap: controller.changeIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  controller.currentIndex == 0
                      ? IconlyBold.home
                      : IconlyLight.home,
                  color:
                      controller.currentIndex == 0 ? Colors.blue : Colors.grey,
                ),
                label: 'Home',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  controller.currentIndex == 1
                      ? Icons.shopping_basket_rounded
                      : Icons.shopping_basket_rounded,
                  color:
                      controller.currentIndex == 1 ? Colors.blue : Colors.grey,
                ),
                label: 'Basket',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  controller.currentIndex == 2
                      ? IconlyBold.profile
                      : IconlyLight.profile,
                  color:
                      controller.currentIndex == 2 ? Colors.blue : Colors.grey,
                ),
                label: 'Profile',
                backgroundColor: Colors.white,
              ),
            ],
          ),
        );
      },
    );
  }
}
