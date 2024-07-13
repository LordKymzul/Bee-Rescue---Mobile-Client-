import 'package:beerescue_mobile/features/view/components/card/case/case-card.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/constant/size-constant.dart';
import 'package:flutter/material.dart';

import '../../../../model/case-entity.dart';
import '../../../../model/user-entity.dart';

class UserDetailCasesScreen extends StatelessWidget {
  UserDetailCasesScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listCase.length,
      itemBuilder: (context, index) {
        if (listCase[index].caseStatus != 'Success') {
          return Container();
        }
        return buildCaseCard(listCase[index]);
      },
    );
  }

  Widget buildCaseCard(CaseEntity caseEntity) => Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: SizeConstant.md, vertical: SizeConstant.sm),
        child: CaseCard(
          caseEntity: caseEntity,
          onTap: () {},
        ),
      );
}
