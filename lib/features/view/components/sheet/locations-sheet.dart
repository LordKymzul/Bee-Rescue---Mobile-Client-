import 'dart:convert';

import 'package:beerescue_mobile/features/controller/provider/location-provider.dart';
import 'package:beerescue_mobile/features/model/autocomplete-prediction.dart';
import 'package:beerescue_mobile/features/model/place-autocomplete-response.dart';
import 'package:beerescue_mobile/features/view/components/button/default-button.dart';
import 'package:beerescue_mobile/features/view/components/chip/sheet-chip.dart';
import 'package:beerescue_mobile/features/view/components/input/invisible-input.dart';
import 'package:beerescue_mobile/main.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/constant/size-constant.dart';
import 'package:beerescue_mobile/shared/style/myappbar-style.dart';
import 'package:beerescue_mobile/shared/style/mytext-style.dart';
import 'package:beerescue_mobile/shared/utils/mysizebox.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class LocationsSheet extends StatelessWidget {
  const LocationsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationProvider>(
      builder: (context, value, child) {
        List<AutoCompletePrediction> placePredictions = value.placePredictions;
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
          const Center(child: SheetChip()),
          MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
          buildHeader(context),
          MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
          buildSearchField(context),
          buildCurrentLocationButton(context),
          Expanded(
              child: ListView.builder(
            itemCount: placePredictions.length,
            itemBuilder: (context, index) {
              return buildResultLocationCard(context, placePredictions[index]);
            },
          ))
        ]);
      },
    );
  }

  Widget buildHeader(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeConstant.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Locations',
              style: MyTextStyle.getTitleStyle(
                  context, SizeConstant.fontSizeLg, context.onBackgroundColor),
            ),
            MySizebox.getVerticalSizedBox(SizeConstant.spaceSm),
            Text(
              'Choose your bee hive location.',
              style: MyTextStyle.getSubTitleStyle(
                  context, SizeConstant.fontSizeSm, context.onBackgroundColor),
            )
          ],
        ),
      );

  Widget buildSearchField(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeConstant.md),
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: SizeConstant.md, vertical: SizeConstant.xs),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SizeConstant.md),
              border: Border.all(color: context.greyColor)),
          child: Row(
            children: [
              Expanded(
                  child: InvisibleInput(
                inputHint: 'Search your location',
                inputOnChanged: (value) {
                  Provider.of<LocationProvider>(context, listen: false)
                      .placeAutoComplete(value);
                },
              )),
              Icon(
                Iconsax.search_normal_copy,
                color: context.greyColor,
              )
            ],
          ),
        ),
      );

  Widget buildCurrentLocationButton(BuildContext context) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: SizeConstant.sm),
            child: Divider(
              thickness: 1,
              color: context.greyColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: SizeConstant.md),
            child: DefaultButton(
                buttonTitle: 'Use My Current Location',
                buttonOnPressed: () {},
                isPrimary: true),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: SizeConstant.sm),
            child: Divider(
              thickness: 1,
              color: context.greyColor,
            ),
          ),
        ],
      );

  Widget buildResultLocationCard(
          BuildContext context, AutoCompletePrediction eachPlace) =>
      Column(
        children: [
          ListTile(
            onTap: () {
              Provider.of<LocationProvider>(context, listen: false)
                  .handleSelectedPlace(eachPlace);
              Navigator.pop(context);
            },
            leading: Icon(
              Iconsax.location_copy,
              color: context.primaryColor,
            ),
            title: Text(
              eachPlace.description!,
              style: MyTextStyle.getTitleStyle(
                  context, SizeConstant.fontSizeMd, context.onBackgroundColor),
            ),
          ),
          Divider(
            color: context.greyColor,
          )
        ],
      );
}
