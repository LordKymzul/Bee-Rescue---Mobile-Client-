import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:flutter/material.dart';

class AvatarCard extends StatelessWidget {
  final String imagePath;
  final double radius;
  const AvatarCard({super.key, required this.imagePath, required this.radius});

  @override
  Widget build(BuildContext context) {
    return buildAvatarCard(context);
  }

  Widget buildAvatarCard(BuildContext context) => CircleAvatar(
        backgroundColor: context.primaryColor,
        backgroundImage: AssetImage(imagePath),
        radius: radius,
      );
}
