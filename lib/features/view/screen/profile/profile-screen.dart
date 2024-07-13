import 'package:beerescue_mobile/features/view/components/card/util/avatar-card.dart';
import 'package:beerescue_mobile/features/view/components/card/profile/profile-card.dart';
import 'package:beerescue_mobile/features/view/components/chip/role-chip.dart';
import 'package:beerescue_mobile/features/view/screen/profile/draft-screen.dart';
import 'package:beerescue_mobile/features/view/screen/profile/personal-information-screen.dart';
import 'package:beerescue_mobile/features/view/screen/profile/schedule-screen.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/constant/assets-constant.dart';
import 'package:beerescue_mobile/shared/constant/size-constant.dart';
import 'package:beerescue_mobile/shared/style/myappbar-style.dart';
import 'package:beerescue_mobile/shared/style/mytext-style.dart';
import 'package:beerescue_mobile/shared/utils/mysizebox.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Map<String, dynamic>> listProfileCard = [
    {
      "title": "Personal Information",
      "iconData": Iconsax.user_copy,
    },
    {
      "title": "Draft",
      "iconData": Iconsax.folder_copy,
    },
    {
      "title": "Favourite Bee Hiver",
      "iconData": Iconsax.heart_copy,
    },
    {
      "title": "Privacy & Security",
      "iconData": Iconsax.lock_copy,
    },
    {
      "title": "Schedule",
      "iconData": Iconsax.clock_copy,
    },
  ];

  final Map<String, Widget Function(BuildContext)> navigationRoutes = {
    'Personal Information': (context) => PersonalInformationScreen(),
    'Draft': (context) => DraftScreen(),
    'Favourite Bee Hiver': (context) => DraftScreen(),
    'Privacy & Security': (context) => DraftScreen(),
    'Schedule': (context) => ScheduleScreen()
  };

  void setOnTap(String title) {
    final routeBuilder = navigationRoutes[title];
    if (routeBuilder != null) {
      Navigator.of(context).push(MaterialPageRoute(builder: routeBuilder));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.backgroundColor,
        appBar: buildAppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
            buildHeaderProfile(),
            MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
            Divider(
              color: context.secondaryVariantColor,
              thickness: 1,
            ),
            MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
            Expanded(
                child: ListView.builder(
              itemCount: listProfileCard.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: SizeConstant.md),
                  child: ProfileCard(
                    title: listProfileCard[index]['title'],
                    iconData: listProfileCard[index]['iconData'],
                    onTap: () {
                      setOnTap(listProfileCard[index]['title']);
                    },
                  ),
                );
              },
            ))
          ],
        ));
  }

  AppBar buildAppBar() => MyAppBarStyle.defaultAppBar(
      context,
      Text(
        'Profile',
        style: MyTextStyle.getTitleStyle(
            context, SizeConstant.fontSizeXXlg, context.onBackgroundColor),
      ));

  Widget buildHeaderProfile() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeConstant.md),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AvatarCard(imagePath: AssetsConstant.avatarDummy, radius: 35),
            MySizebox.getHorizontalSizedBox(SizeConstant.spaceMd),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Muhammad Hakim',
                    style: MyTextStyle.getTitleStyle(context,
                        SizeConstant.fontSizeLg, context.onBackgroundColor),
                  ),
                  MySizebox.getVerticalSizedBox(SizeConstant.spaceSm),
                  const RoleChip(role: 'Hiver')
                ],
              ),
            ),
          ],
        ),
      );
}
