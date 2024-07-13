import 'package:flutter/material.dart';

import '../../../../shared/constant/assets-constant.dart';
import '../../../../shared/constant/size-constant.dart';

class DefaultImage extends StatelessWidget {
  final String imagePath;
  final double imageWidth, imageHeight;
  const DefaultImage(
      {super.key,
      required this.imagePath,
      required this.imageWidth,
      required this.imageHeight});

  @override
  Widget build(BuildContext context) {
    return buildDefaultImage();
  }

  Widget buildDefaultImage() => ClipRRect(
        borderRadius: BorderRadius.circular(SizeConstant.md),
        child: Image.asset(
          imagePath,
          width: imageWidth,
          height: imageHeight,
          fit: BoxFit.cover,
        ),
      );
}
