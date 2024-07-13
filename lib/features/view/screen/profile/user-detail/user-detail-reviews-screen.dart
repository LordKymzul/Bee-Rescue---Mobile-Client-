import 'package:beerescue_mobile/features/view/components/card/review/user-review-card.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/constant/size-constant.dart';

class UserDetailReviewsScreen extends StatelessWidget {
  const UserDetailReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 30,
      itemBuilder: (context, index) {
        return buildUserReviewCard();
      },
    );
  }

  Widget buildUserReviewCard() => const Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConstant.md, vertical: SizeConstant.sm),
        child: UserReviewCard(),
      );
}
