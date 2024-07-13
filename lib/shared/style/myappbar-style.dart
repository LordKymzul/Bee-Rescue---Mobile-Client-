import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:flutter/material.dart';

import '../constant/assets-constant.dart';
import '../constant/size-constant.dart';
import 'mytext-style.dart';

class MyAppBarStyle {
  static AppBar plainAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: context.backgroundColor,
      elevation: 0,
    );
  }

  static AppBar defaultAppBar(BuildContext context, Widget content) {
    return AppBar(
        backgroundColor: context.backgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: content);
  }

  static Widget buildSilverAppBar(BuildContext context, List<Widget> tabs) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: context.backgroundColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      shape:
          Border(bottom: BorderSide(color: context.backgroundColor, width: 1)),
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: TabBar(
              indicatorColor: context.primaryColor,
              indicatorWeight: 5,
              tabs: tabs)),
    );
  }

  static Widget buildCustomSilverAppBar(
    BuildContext context,
    List<Widget> tabs,
    final void Function(int)? onTap,
  ) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: context.backgroundColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      shape:
          Border(bottom: BorderSide(color: context.backgroundColor, width: 1)),
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: TabBar(
              onTap: onTap,
              indicatorColor: context.primaryColor,
              indicatorWeight: 5,
              tabs: tabs)),
    );
  }
}
