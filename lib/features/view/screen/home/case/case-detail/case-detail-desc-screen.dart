import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/constant/assets-constant.dart';
import 'package:beerescue_mobile/shared/constant/size-constant.dart';
import 'package:beerescue_mobile/shared/style/mytext-style.dart';
import 'package:beerescue_mobile/shared/utils/mysizebox.dart';
import 'package:flutter/material.dart';

import '../../../../components/card/case/case-detail-card.dart';

class CaseDetailDescScreen extends StatelessWidget {
  CaseDetailDescScreen({super.key});

  final List<Map<String, dynamic>> listCaseDetail = [
    {"caseDetailTitle": "Case ID", "caseDetailDesc": "C-001"},
    {
      "caseDetailTitle": "Location",
      "caseDetailDesc":
          "Fakulti Sains Komputer & Teknologi Maklumat, Universiti Putra Malaysia, Serdang, Selangor"
    },
    {"caseDetailTitle": "Hiver", "caseDetailDesc": "Irfan Ghaphar"},
    {"caseDetailTitle": "Client", "caseDetailDesc": "Hakim"},
    {"caseDetailTitle": "Hiver Date", "caseDetailDesc": "22 May 2024  18:00"},
    {"caseDetailTitle": "Hiver Area", "caseDetailDesc": "1.56 m2"},
    {"caseDetailTitle": "Hive Height", "caseDetailDesc": "200m"}
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: listCaseDetail.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: SizeConstant.md, vertical: SizeConstant.md),
                child: CaseDetailCard(eachCaseDetail: listCaseDetail[index]),
              );
            },
          ),
          buildAdditionalInfo(context)
        ],
      ),
    );
  }

  Widget buildAdditionalInfo(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: SizeConstant.md, vertical: SizeConstant.md),
            child: Text(
              'Addtional Pictures',
              style: MyTextStyle.getTitleStyle(
                  context, SizeConstant.fontSizeMd, context.onBackgroundColor),
            ),
          ),
          MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
          buildListAdditionalPictures()
        ],
      );

  Widget buildListAdditionalPictures() => SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: SizeConstant.md),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(SizeConstant.md),
                child: Image.asset(
                  AssetsConstant.avatarDummy,
                  height: 100,
                  width: 100,
                ),
              ),
            );
          },
        ),
      );
}
