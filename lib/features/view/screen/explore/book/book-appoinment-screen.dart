import 'package:beerescue_mobile/features/controller/provider/datetime-provider.dart';
import 'package:beerescue_mobile/features/view/components/button/container-button.dart';
import 'package:beerescue_mobile/features/view/components/button/default-button.dart';
import 'package:beerescue_mobile/features/view/components/form/footer-input-form.dart';
import 'package:beerescue_mobile/features/view/components/input/prefix-icon-input.dart';
import 'package:beerescue_mobile/features/view/components/sheet/datetime-sheet.dart';
import 'package:beerescue_mobile/features/view/components/sheet/locations-sheet.dart';
import 'package:beerescue_mobile/features/view/screen/explore/book/book-result-screen.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/style/mysheet-style.dart';
import 'package:beerescue_mobile/shared/utils/mysizebox.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../../shared/constant/size-constant.dart';
import '../../../../../shared/style/myappbar-style.dart';
import '../../../../../shared/style/mytext-style.dart';

class BookAppoinmentScreen extends StatefulWidget {
  const BookAppoinmentScreen({super.key});

  @override
  State<BookAppoinmentScreen> createState() => _BookAppoinmentScreenState();
}

class _BookAppoinmentScreenState extends State<BookAppoinmentScreen> {
  final TextEditingController tcLocation = TextEditingController();

  void handleLocationBottomSheet() {
    MySheetStyle.defaultBottomSheet(context, LocationsSheet(), 800, () {});
  }

  void handleDateTimeBottomSheet() {
    MySheetStyle.defaultBottomSheet(context, DateTimeSheet(), 400, () {
      Provider.of<DateTimeProvider>(context, listen: false)
          .selectDayTime(DateTime.now());

      print('Onclose');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.backgroundColor,
      appBar: buildAppBar(context),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(child: buildForms()),
          ),
          buildFooter()
        ],
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
            'Book Appoinment',
            style: MyTextStyle.getTitleStyle(
                context, SizeConstant.fontSizeLg, context.onBackgroundColor),
          )
        ],
      ));

  Widget buildForms() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: SizeConstant.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
                FooterInputForm(
                    formTitle: 'Hive Detected',
                    formContent: ContainerButton(
                      title: 'Hive Detected',
                      iconData: Iconsax.d_cube_scan_copy,
                      onPressed: () {},
                    ),
                    formFooter:
                        'Please insert the detected hive image that has been analyzed.'),
                MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
                FooterInputForm(
                    formTitle: 'Location',
                    formContent: buildStaticInput(
                        'UPM, Serdang', Iconsax.location_copy, () {
                      handleLocationBottomSheet();
                    }),
                    formFooter: 'Choose your hive location here.'),
                MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
                FooterInputForm(
                    formTitle: 'Date & Time',
                    formContent: buildStaticInput(
                        '8 April 2024 13:00', Iconsax.clock_copy, () {
                      handleDateTimeBottomSheet();
                    }),
                    formFooter: 'Choose your valid hive date and time here.'),
                MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: FooterInputForm(
                          formTitle: 'Hive Size',
                          formContent: buildStaticInput(
                              '10 m2', Iconsax.size_copy, () {}),
                          formFooter: 'Insert your range hive size.'),
                    ),
                    MySizebox.getHorizontalSizedBox(SizeConstant.md),
                    Expanded(
                      child: FooterInputForm(
                          formTitle: 'Hive Height',
                          formContent:
                              buildStaticInput('1.60 m', Icons.height, () {}),
                          formFooter: 'Insert your range hive height.'),
                    ),
                  ],
                ),
                MySizebox.getVerticalSizedBox(SizeConstant.md),
                FooterInputForm(
                    formTitle: 'Additional Pictures',
                    formContent: SizedBox(
                      width: 150,
                      child: ContainerButton(
                        title: 'Pictures',
                        iconData: Iconsax.camera_copy,
                        onPressed: () {},
                      ),
                    ),
                    formFooter:
                        'You can upload 5 pictures that are related to your hive location.')
              ],
            ),
          ),
        ],
      );

  Widget buildStaticInput(String hint, IconData iconData, VoidCallback onTap) =>
      InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(SizeConstant.md),
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: SizeConstant.md, vertical: SizeConstant.md),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SizeConstant.sm),
              border: Border.all(color: context.greyColor)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                hint,
                style: MyTextStyle.getSubTitleStyle(
                    context, SizeConstant.md, context.onBackgroundColor),
              ),
              Icon(
                iconData,
                color: context.greyColor,
              )
            ],
          ),
        ),
      );

  Widget buildFooter() => Padding(
        padding: const EdgeInsets.only(
            left: SizeConstant.md,
            right: SizeConstant.md,
            bottom: SizeConstant.md),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: DefaultButton(
                  buttonTitle: 'Draft',
                  buttonOnPressed: () {},
                  isPrimary: false),
            ),
            MySizebox.getHorizontalSizedBox(SizeConstant.spaceMd),
            Expanded(
              child: DefaultButton(
                  buttonTitle: 'Book',
                  buttonOnPressed: () {
                    print('book');
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BookResultScreen(),
                    ));
                  },
                  isPrimary: true),
            )
          ],
        ),
      );
}
