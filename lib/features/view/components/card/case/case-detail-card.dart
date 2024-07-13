import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/constant/size-constant.dart';
import '../../../../../shared/style/mytext-style.dart';

class CaseDetailCard extends StatelessWidget {
  final Map<String, dynamic> eachCaseDetail;
  const CaseDetailCard({super.key, required this.eachCaseDetail});

  @override
  Widget build(BuildContext context) {
    return buildCaseDetailCard(context);
  }

  Widget buildCaseDetailCard(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              eachCaseDetail['caseDetailTitle'],
              style: MyTextStyle.getTitleStyle(
                  context, SizeConstant.fontSizeMd, context.onBackgroundColor),
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            child: Text(
              eachCaseDetail['caseDetailDesc'],
              style: MyTextStyle.getSubTitleStyle(
                  context, SizeConstant.fontSizeMd, context.onBackgroundColor),
              textAlign: TextAlign.end,
            ),
          )
        ],
      );
}
