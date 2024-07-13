import 'package:beerescue_mobile/features/model/case-entity.dart';
import 'package:beerescue_mobile/features/view/components/button/default-button.dart';
import 'package:beerescue_mobile/features/view/components/card/util/default-card.dart';
import 'package:beerescue_mobile/features/view/components/card/util/entity-card.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/utils/calculation.s.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/constant/assets-constant.dart';
import '../../../../../shared/constant/size-constant.dart';
import '../../../../../shared/style/mytext-style.dart';
import '../../../../../shared/utils/mysizebox.dart';
import '../../chip/status-chip.dart';

class CaseCard extends StatelessWidget {
  final CaseEntity caseEntity;
  final VoidCallback onTap;
  const CaseCard({super.key, required this.onTap, required this.caseEntity});

  @override
  Widget build(BuildContext context) {
    return buildCaseCard(context);
  }

  Widget buildCaseCard(BuildContext context) => InkWell(
        borderRadius: BorderRadius.circular(SizeConstant.md),
        onTap: onTap,
        child: DefaultCard(
            content: Column(
          children: [
            buildHeaderCard(context),
            MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
            buildContentCard(),
            MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
            buildFooter(context),
            caseEntity.caseStatus == 'Pending'
                ? MySizebox.getVerticalSizedBox(SizeConstant.spaceMd)
                : Container(),
            caseEntity.caseStatus == 'Pending' ? buildButtons() : Container()
          ],
        )),
      );

  Widget buildHeaderCard(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Case:#${caseEntity.caseID}',
            style: MyTextStyle.getTitleStyle(
                context, SizeConstant.fontSizeMd, context.onBackgroundColor),
          ),
          Text(
            Calculation.formatDefaultDateTime(caseEntity.caseCreatedAt!),
            style: MyTextStyle.getSubTitleStyle(
                context, SizeConstant.fontSizeSm, context.onBackgroundColor),
          )
        ],
      );

  Widget buildContentCard() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: EntityCard(
                  title: 'Irfan Ghaphar',
                  desc: 'Hiver',
                  imagePath: AssetsConstant.dpIrfan)),
          StatusChip(status: caseEntity.caseStatus!),
        ],
      );

  Widget buildFooter(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: buildFooterCard(
                context, 'Case Location', caseEntity.caseLocation!),
          ),
          Expanded(
              child: buildFooterCard(context, 'Case Date',
                  Calculation.formatDefaultDateTime(caseEntity.caseCreatedAt!)))
        ],
      );

  Widget buildFooterCard(
          BuildContext context, final String title, final String desc) =>
      Column(
        crossAxisAlignment: title == 'Case Date'
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: MyTextStyle.getTitleStyle(
                context, SizeConstant.fontSizeMd, context.onBackgroundColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          MySizebox.getVerticalSizedBox(SizeConstant.spaceSm),
          Text(
            desc,
            style: MyTextStyle.getSubTitleStyle(
                context, SizeConstant.fontSizeSm, context.onBackgroundColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        ],
      );

  Widget buildButtons() {
    if (caseEntity.caseHiver!.userStatus == 'Hiver') {
      return Row(
        children: [
          Expanded(
              child: DefaultButton(
                  buttonTitle: 'Decline',
                  buttonOnPressed: () {},
                  isPrimary: false)),
          MySizebox.getHorizontalSizedBox(SizeConstant.spaceMd),
          Expanded(
              child: DefaultButton(
                  buttonTitle: 'Accept',
                  buttonOnPressed: () {},
                  isPrimary: true))
        ],
      );
    }
    return DefaultButton(
        buttonTitle: 'Cancel', buttonOnPressed: () {}, isPrimary: false);
  }
}
