import 'package:beerescue_mobile/features/view/screen/home/case/case-screen.dart';
import 'package:beerescue_mobile/features/view/screen/explore/explore-screen.dart';
import 'package:beerescue_mobile/features/view/screen/home/home-screen.dart';
import 'package:beerescue_mobile/features/view/screen/messages/messages-screen.dart';
import 'package:beerescue_mobile/features/view/screen/profile/profile-screen.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/style/mytext-style.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  List<Widget> _pages = [
    HomeScreen(),
    ExploreScreen(),
    MessagesScreen(),
    ProfileScreen()
  ];

  void setSelectedIndex(int currentIndex) {
    setState(() {
      selectedIndex = currentIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      bottomNavigationBar: buildNavBar(),
      body: _pages[selectedIndex],
    );
  }

  Widget buildNavBar() => NavigationBar(
        backgroundColor: context.surfaceColor,
        height: 80,
        elevation: 5,
        indicatorColor: context.primaryColor.withOpacity(0.4),
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) {
          setSelectedIndex(value);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Iconsax.home_2_copy),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Iconsax.map_copy),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Iconsax.message_copy),
            label: 'Messages',
          ),
          NavigationDestination(
            icon: Icon(Iconsax.user_copy),
            label: 'Profile',
          )
        ],
      );

  Widget first() => BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          setSelectedIndex(value);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            activeIcon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder_outlined),
            activeIcon: Icon(Icons.folder),
            label: 'Case',
          ),
        ],
        backgroundColor: context.backgroundColor,
        selectedLabelStyle:
            MyTextStyle.getTitleStyle(context, 12, context.primaryColor),
        unselectedLabelStyle:
            MyTextStyle.getTitleStyle(context, 12, context.onBackgroundColor),
        selectedItemColor: context.primaryColor,
      );
}
