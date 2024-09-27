import 'package:appbar/common/utils/app_colors.dart';
import 'package:appbar/common/utils/app_icons.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';
import 'custom_search_bar.dart';

class DesktopAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double screenWidth;
  final List<Widget> actions;

  const DesktopAppBar({
    super.key,
    required this.screenWidth,
    this.actions = const [],
  });

  @override
  State<DesktopAppBar> createState() => _DesktopAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class _DesktopAppBarState extends State<DesktopAppBar> {
  List<String> menus = ['Home', 'Shop', 'Contact'];
  int selectedIndex = 0;
  String hoverMenu = '';

  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void changeHoverMenu(String menu) {
    setState(() {
      hoverMenu = menu;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgWhite,
      padding: EdgeInsets.symmetric(horizontal: widget.screenWidth * 0.03),
      child: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 0,
          leading: Image.asset(
            AppIcons.logo,
            fit: BoxFit.cover,
            width: 70,
          ),
          leadingWidth: 70,
          title: RichText(
            text: TextSpan(
              text: 'ChairRental',
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: AppColors.primaryBlue,
                  fontSize: widget.screenWidth * 0.025,
                  fontWeight: FontWeight.w500),
              children: const <TextSpan>[
                TextSpan(
                  text: 'Express',
                  style: TextStyle(
                      color: AppColors.textBlack, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
          toolbarHeight: 200,
          actions: [
            Row(
              children: List.generate(menus.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: () {
                      changeIndex(index);
                    },
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: MouseRegion(
                      onEnter: (_) => changeHoverMenu(menus[index]),
                      onExit: (_) => changeHoverMenu(''),
                      child: Text(
                        menus[index],
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                color: menus[index] == hoverMenu
                                    ? AppColors.primaryBlue
                                    : selectedIndex == index
                                        ? AppColors.primaryBlue
                                        : AppColors.primaryGrey,
                                fontSize: 18,
                                fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(width: 20),
            SizedBox(child: SearchBarWidget(screenWidth: widget.screenWidth))
          ]),
    );
  }
}

class MobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;

  const MobileAppBar({
    super.key,
    required this.title,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: actions,
      backgroundColor: Colors.blueGrey,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}

class TabletAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;

  const TabletAppBar({
    super.key,
    required this.title,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: actions,
      backgroundColor: Colors.blueGrey,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}

class TvAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;

  const TvAppBar({
    super.key,
    required this.title,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: actions,
      backgroundColor: Colors.blueGrey,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}
