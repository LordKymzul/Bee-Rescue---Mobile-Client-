import 'package:beerescue_mobile/features/view/components/button/default-button.dart';
import 'package:beerescue_mobile/features/view/components/card/util/avatar-card.dart';
import 'package:beerescue_mobile/features/view/components/card/review/user-rating-card.dart';
import 'package:beerescue_mobile/features/view/components/input/textarea-input.dart';
import 'package:beerescue_mobile/features/view/screen/home/case/review/review-result-screen.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/constant/assets-constant.dart';
import 'package:beerescue_mobile/shared/utils/mysizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../../shared/constant/size-constant.dart';
import '../../../../../../shared/style/myappbar-style.dart';
import '../../../../../../shared/style/mytext-style.dart';

class WriteReviewScreen extends StatefulWidget {
  const WriteReviewScreen({super.key});

  @override
  State<WriteReviewScreen> createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen> {
  double rating = 0.0;
  final TextEditingController tcReview = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: buildAppBar(context),
      resizeToAvoidBottomInset: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [buildReviewForm(), buildSubmitButton()],
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
            'Reviewing',
            style: MyTextStyle.getTitleStyle(
                context, SizeConstant.fontSizeLg, context.onBackgroundColor),
          )
        ],
      ));

  Widget buildReviewForm() => Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
                    buildUserProfile(),
                    MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
                    buildContainerRating(),
                    MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
                    buildContainerReviewInput()
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildUserProfile() => Column(
        children: [
          const AvatarCard(imagePath: AssetsConstant.dpIrfan, radius: 60),
          MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
          Text(
            'Irfan Ghaphar',
            style: MyTextStyle.getTitleStyle(
                context, SizeConstant.fontSizeLg, context.onBackgroundColor),
          ),
          MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
          UserRatingCard()
        ],
      );

  Widget buildContainerRating() => Column(
        children: [
          Text(
            'Your overall rating',
            style: MyTextStyle.getTitleStyle(
                context, SizeConstant.fontSizeMd, context.onBackgroundColor),
          ),
          MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
          PannableRatingBar(
            rate: rating,
            items: List.generate(
                5,
                (index) => RatingWidget(
                      selectedColor: context.primaryColor,
                      unSelectedColor: Colors.grey,
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: SizeConstant.sm),
                        child: Icon(
                          Icons.star,
                          size: SizeConstant.iconLg,
                        ),
                      ),
                    )),
            onChanged: (value) {
              // the rating value is updated on tap or drag.
              setState(() {
                rating = value;
              });
            },
          ),
        ],
      );

  Widget buildContainerReviewInput() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeConstant.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Give a review here',
                  style: MyTextStyle.getTitleStyle(context,
                      SizeConstant.fontSizeMd, context.onBackgroundColor),
                ),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(SizeConstant.xl),
                  child: Icon(
                    Icons.attach_file_outlined,
                    color: context.greyColor,
                  ),
                )
              ],
            ),
            MySizebox.getVerticalSizedBox(SizeConstant.spaceMd),
            TextareaInput(
                inputTc: tcReview,
                inputHint: 'Write something here...',
                inputMaxlines: 10)
          ],
        ),
      );

  Widget buildSubmitButton() => Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: SizeConstant.md, vertical: SizeConstant.sm),
        child: DefaultButton(
            buttonTitle: 'Submit',
            buttonOnPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => ReviewResultScreen(),
                  ),
                  (route) => false);
            },
            isPrimary: true),
      );
}
