import 'package:flutter/material.dart';

final deviceSize = MediaQueryData.fromView(
  WidgetsBinding.instance.platformDispatcher.views.first,
).size;

final double deviceWidth = deviceSize.width;
final double deviceHeight = deviceSize.height;

extension XScreenType on double {
  bool get isTv => this > 1440;
  bool get isDesktop => this > 830 && this <= 1440;
  bool get isTablet => this > 430 && this <= 830;
  bool get isMobile => this <= 430;
}

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    required this.tvScreen,
    required this.desktopScreen,
    required this.mobileScreen,
    required this.tabletScreen,
    super.key,
  });

  final Widget tvScreen;
  final Widget desktopScreen;
  final Widget mobileScreen;
  final Widget tabletScreen;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, contraint) {
      double screenWidth = contraint.maxWidth;
      if (screenWidth.isMobile) {
        return mobileScreen;
      } else if (screenWidth.isDesktop) {
        return desktopScreen;
      }
      if (screenWidth.isTablet) {
        return tabletScreen;
      } else {
        return tvScreen;
      }
    });
  }
}
