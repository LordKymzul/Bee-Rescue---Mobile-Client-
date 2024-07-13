import 'package:beerescue_mobile/features/model/case-entity.dart';
import 'package:beerescue_mobile/features/model/user-entity.dart';
import 'package:beerescue_mobile/features/view/components/card/case/case-card.dart';
import 'package:beerescue_mobile/features/view/components/card/util/default-card.dart';
import 'package:beerescue_mobile/features/view/components/card/util/entity-card.dart';
import 'package:beerescue_mobile/features/view/components/chip/select-chip.dart';
import 'package:beerescue_mobile/features/view/components/chip/status-chip.dart';
import 'package:beerescue_mobile/features/view/screen/home/case/case-detail/case-detail-screen.dart';
import 'package:beerescue_mobile/main.dart';
import 'package:beerescue_mobile/shared/animation/fade-animation.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/constant/assets-constant.dart';
import 'package:beerescue_mobile/shared/constant/size-constant.dart';
import 'package:beerescue_mobile/shared/style/myappbar-style.dart';
import 'package:beerescue_mobile/shared/style/mytext-style.dart';
import 'package:beerescue_mobile/shared/utils/mysizebox.dart';
import 'package:flutter/material.dart';

class CaseScreen extends StatefulWidget {
  const CaseScreen({super.key});

  @override
  State<CaseScreen> createState() => _CaseScreenState();
}

class _CaseScreenState extends State<CaseScreen> {
  List<Map<String, dynamic>> listSelectedCase = [
    {"name": "All", "isSelected": true},
    {"name": "Active", "isSelected": false},
    {"name": "Past", "isSelected": false},
    {"name": "Request", "isSelected": false}
  ];

  final List<CaseEntity> listCase = [
    CaseEntity(
        caseID: 'C-001',
        caseLocation: 'Wangsa Maju, Kuala Lumpur, 53000 Kuala Lumpur',
        caseStatus: 'Active',
        caseDate: DateTime.now().subtract(Duration(days: 1)),
        caseCreatedAt: DateTime.now().subtract(Duration(days: 2)),
        caseHiver: UserEntity(
            userID: 'H-001', userName: 'Irfan Ghaphar', userStatus: 'Hiver'),
        caseClient: UserEntity(
            userID: 'C-001', userName: 'Muhammad Hakim', userStatus: 'Client')),
    CaseEntity(
        caseID: 'C-002',
        caseLocation: 'Taman Melati, Kuala Lumpur, 53100 Kuala Lumpur',
        caseStatus: 'Success',
        caseDate: DateTime.now().subtract(Duration(days: 5)),
        caseCreatedAt: DateTime.now().subtract(Duration(days: 6)),
        caseHiver: UserEntity(
            userID: 'H-002', userName: 'Ali Ahmad', userStatus: 'Hiver'),
        caseClient: UserEntity(
            userID: 'C-002', userName: 'Siti Aminah', userStatus: 'Client')),
    CaseEntity(
        caseID: 'C-003',
        caseLocation: 'Setapak, Kuala Lumpur, 53300 Kuala Lumpur',
        caseStatus: 'Pending',
        caseDate: DateTime.now(),
        caseCreatedAt: DateTime.now().subtract(Duration(hours: 1)),
        caseHiver: UserEntity(
            userID: 'H-003', userName: 'Zaid Hassan', userStatus: 'Hiver'),
        caseClient: UserEntity(
            userID: 'C-003', userName: 'Nurul Izzah', userStatus: 'Client')),
    CaseEntity(
        caseID: 'C-004',
        caseLocation: 'Bukit Bintang, Kuala Lumpur, 55100 Kuala Lumpur',
        caseStatus: 'Active',
        caseDate: DateTime.now().subtract(Duration(days: 3)),
        caseCreatedAt: DateTime.now().subtract(Duration(days: 4)),
        caseHiver: UserEntity(
            userID: 'H-004', userName: 'Khalid Omar', userStatus: 'Hiver'),
        caseClient: UserEntity(
            userID: 'C-004', userName: 'Ahmad Ridzuan', userStatus: 'Client')),
    CaseEntity(
        caseID: 'C-005',
        caseLocation: 'Cheras, Kuala Lumpur, 56000 Kuala Lumpur',
        caseStatus: 'Cancelled',
        caseDate: DateTime.now().subtract(Duration(days: 7)),
        caseCreatedAt: DateTime.now().subtract(Duration(days: 8)),
        caseHiver: UserEntity(
            userID: 'H-005', userName: 'Hafiz Rahman', userStatus: 'Hiver'),
        caseClient: UserEntity(
            userID: 'C-005', userName: 'Aisha Karim', userStatus: 'Client'))
  ];

  void setSelected(int currentIndex) {
    setState(() {
      for (int i = 0; i < listSelectedCase.length; i++) {
        listSelectedCase[i]['isSelected'] = false;
      }
      listSelectedCase[currentIndex]['isSelected'] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: buildAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
          buildlistSelectedCase(),
          MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
          buildListCaseCard()
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) => MyAppBarStyle.defaultAppBar(
      context,
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: context.onBackgroundColor,
              )),
          Text(
            'Case',
            style: MyTextStyle.getTitleStyle(
                context, SizeConstant.fontSizeLg, context.onBackgroundColor),
          )
        ],
      ));

  Widget buildlistSelectedCase() => SizedBox(
        height: 35,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listSelectedCase.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: SizeConstant.spaceMd),
              child: SelectChip(
                title: listSelectedCase[index]['name'],
                isSelected: listSelectedCase[index]['isSelected'],
                onTap: () {
                  setSelected(index);
                },
              ),
            );
          },
        ),
      );

  Widget buildListCaseCard() => Expanded(
          child: ListView.builder(
        itemCount: listCase.length,
        itemBuilder: (context, index) {
          return MyFadeAnimation((0.5 + index), buildCaseCard(listCase[index]));
        },
      ));

  Widget buildCaseCard(CaseEntity caseEntity) => Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: SizeConstant.md, vertical: SizeConstant.sm),
      child: CaseCard(
        caseEntity: caseEntity,
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CaseDetailScreen(),
          ));
        },
      ));
}
