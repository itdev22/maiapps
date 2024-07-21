import 'package:flutter/material.dart';

extension ContextExtention on BuildContext {
  ThemeData get theme => Theme.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get size => mediaQuery.size;
  double get width => size.width;
  double get height => size.height;

  // UserProvider get userProvider => read<UserProvider>();
  // LocalUser? get currentUser => userProvider.user;

  // TabNavigator get tabNavigator => read<TabNavigator>();

  // Course? get courseOfTheDay => read<CourseOfTheDayNotofier>().courseOfTheday;

  // void pop() => tabNavigator.pop();

  // void push(Widget page) => tabNavigator.push(TabItem(child: page));
}
