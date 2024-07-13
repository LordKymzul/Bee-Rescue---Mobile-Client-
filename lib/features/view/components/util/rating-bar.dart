import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';

import '../../../../shared/constant/size-constant.dart';

class RatingBar extends StatelessWidget {
  final double rating, iconSize, space;

  const RatingBar(
      {super.key,
      required this.rating,
      required this.iconSize,
      required this.space});

  @override
  Widget build(BuildContext context) {
    return buildRatingBar(context);
  }

  Widget buildRatingBar(BuildContext context) => PannableRatingBar(
        rate: rating,
        items: List.generate(
            5,
            (index) => RatingWidget(
                  selectedColor: context.primaryColor,
                  unSelectedColor: Colors.grey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: space),
                    child: Icon(Icons.star, size: iconSize),
                  ),
                )),
      );
}
