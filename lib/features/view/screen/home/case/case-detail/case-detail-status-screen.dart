import 'package:beerescue_mobile/features/view/components/timeline/status-timeline.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/constant/size-constant.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class CaseDetailStatusScreen extends StatelessWidget {
  CaseDetailStatusScreen({super.key});

  final List<Map<String, dynamic>> listCaseStatusTimeline = [
    {
      "statusTitle": "Case Placed",
      "statusDesc": "20 May 2023, 12:56",
      "statusIcon": Iconsax.document_text_copy
    },
    {
      "statusTitle": "Hiver Preparing",
      "statusDesc": "20 May 2023, 12:56",
      "statusIcon": Iconsax.judge_copy
    },
    {
      "statusTitle": "Hiver on the way",
      "statusDesc": "20 May 2023, 12:56",
      "statusIcon": Iconsax.truck_time_copy
    },
    {
      "statusTitle": "Hived",
      "statusDesc": "20 May 2023, 12:56",
      "statusIcon": Icons.work_outline
    },
    {
      "statusTitle": "Completed",
      "statusDesc": "20 May 2023, 12:56",
      "statusIcon": Icons.done_outline
    }
  ];

  @override
  Widget build(BuildContext context) {
    return buildContent();
  }

  Widget buildContent() => ListView.builder(
        itemCount: listCaseStatusTimeline.length,
        itemBuilder: (context, index) {
          final eachStatus = listCaseStatusTimeline[index];
          if (index == 0) {
            return buildStatusTimeline(true, false, true, eachStatus);
          }
          if (index == listCaseStatusTimeline.length - 1) {
            return buildStatusTimeline(false, true, false, eachStatus);
          }
          return buildStatusTimeline(false, false, true, eachStatus);
        },
      );

  Widget buildStatusTimeline(bool isFirst, bool isLast, bool isPast,
          Map<String, dynamic> caseStatusTimeline) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeConstant.md),
        child: StatusTimeline(
          isFirst: isFirst,
          isLast: isLast,
          isPast: isPast,
          caseStatusTimeline: caseStatusTimeline,
        ),
      );
}
