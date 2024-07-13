import 'package:beerescue_mobile/features/view/components/button/default-button.dart';
import 'package:beerescue_mobile/features/view/components/form/default-input-form.dart';
import 'package:beerescue_mobile/features/view/components/input/default-input.dart';
import 'package:beerescue_mobile/features/view/components/input/textarea-input.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/utils/mysizebox.dart';
import 'package:flutter/material.dart';

import '../../../../shared/constant/size-constant.dart';
import '../../../../shared/style/myappbar-style.dart';
import '../../../../shared/style/mytext-style.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  final TextEditingController tcFirstName = TextEditingController();
  final TextEditingController tcAge = TextEditingController();
  final TextEditingController tcStreetAdress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: buildAppBar(context),
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: SizeConstant.md),
                      child: buildBasicInformationForms()),
                  MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: SizeConstant.md),
                    child: Divider(
                      color: context.greyColor,
                      thickness: 1,
                    ),
                  ),
                  MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: SizeConstant.md),
                      child: buildAddressInformationForms())
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: SizeConstant.md,
                right: SizeConstant.md,
                bottom: SizeConstant.md),
            child: DefaultButton(
                buttonTitle: 'SAVE', buttonOnPressed: () {}, isPrimary: true),
          )
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
            'Personal Info',
            style: MyTextStyle.getTitleStyle(
                context, SizeConstant.fontSizeLg, context.onBackgroundColor),
          )
        ],
      ));

  Widget buildHeaderForms(String title, String desc) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: MyTextStyle.getTitleStyle(
                context, SizeConstant.fontSizeLg, context.onBackgroundColor),
          ),
          MySizebox.getVerticalSizedBox(SizeConstant.spaceSm),
          Text(
            desc,
            style: MyTextStyle.getSubTitleStyle(
                context, SizeConstant.fontSizeMd, context.onBackgroundColor),
          ),
        ],
      );

  Widget buildBasicInformationForms() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeaderForms(
              'Basic Information', 'Tell us your basic information here.'),
          MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
          buildNameForms(),
          MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
          buildAgeDOB(),
          MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
          buildNumberEmail(),
          MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
          DefaultInputForm(
              formTitle: 'About',
              formContent: TextareaInput(
                  inputTc: tcFirstName,
                  inputHint: 'Examples: Your experience about bees or etc',
                  inputMaxlines: 5)),
        ],
      );

  Widget buildNameForms() => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: DefaultInputForm(
                formTitle: 'First Name',
                formContent: DefaultInput(
                    inputType: TextInputType.name,
                    inputController: tcFirstName,
                    inputHint: 'Example: Muhammad')),
          ),
          MySizebox.getHorizontalSizedBox(SizeConstant.spaceMd),
          Expanded(
            child: DefaultInputForm(
                formTitle: 'Last Name',
                formContent: DefaultInput(
                    inputType: TextInputType.name,
                    inputController: tcFirstName,
                    inputHint: 'Example: Hakim')),
          ),
        ],
      );

  Widget buildAgeDOB() => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: DefaultInputForm(
                formTitle: 'Age',
                formContent: DefaultInput(
                    inputType: TextInputType.number,
                    inputController: tcFirstName,
                    inputHint: 'Example: 21')),
          ),
          MySizebox.getHorizontalSizedBox(SizeConstant.spaceMd),
          Expanded(
            child: DefaultInputForm(
                formTitle: 'Date of Birth',
                formContent: DefaultInput(
                  inputController: tcFirstName,
                  inputHint: 'Example: 1/1/2000',
                  inputType: TextInputType.datetime,
                )),
          ),
        ],
      );

  Widget buildNumberEmail() => Row(
        children: [
          Expanded(
            child: DefaultInputForm(
                formTitle: 'Phone Number',
                formContent: DefaultInput(
                  inputController: tcFirstName,
                  inputHint: 'Example: +6012 3456 7890',
                  inputType: TextInputType.phone,
                )),
          ),
          MySizebox.getHorizontalSizedBox(SizeConstant.spaceMd),
          Expanded(
            child: DefaultInputForm(
                formTitle: 'Email',
                formContent: DefaultInput(
                  inputController: tcFirstName,
                  inputHint: 'Example: john@gmail.com',
                  inputType: TextInputType.emailAddress,
                )),
          ),
        ],
      );

  Widget buildAddressInformationForms() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeaderForms('Address Information',
              'Tell us about your address information here. Dont worry we dont share your privacy.'),
          MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
          DefaultInputForm(
              formTitle: 'Street Address',
              formContent: DefaultInput(
                  inputController: tcStreetAdress,
                  inputHint: 'Example: Jalan Taman Rashidah Utama',
                  inputType: TextInputType.streetAddress)),
          MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
          DefaultInputForm(
              formTitle: 'Apt, Suite, Bldg (Optional)',
              formContent: DefaultInput(
                  inputController: tcStreetAdress,
                  inputHint: 'Example: Blok A Tingkat 34',
                  inputType: TextInputType.streetAddress)),
          MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
          DefaultInputForm(
              formTitle: 'City',
              formContent: DefaultInput(
                  inputController: tcStreetAdress,
                  inputHint: 'Example: Kuala Lumpur',
                  inputType: TextInputType.streetAddress)),
          MySizebox.getVerticalSizedBox(SizeConstant.spaceLg),
          buildStatePostcode()
        ],
      );

  Widget buildStatePostcode() => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: DefaultInputForm(
                formTitle: 'State',
                formContent: DefaultInput(
                    inputType: TextInputType.name,
                    inputController: tcFirstName,
                    inputHint: 'Example: Muhammad')),
          ),
          MySizebox.getHorizontalSizedBox(SizeConstant.spaceMd),
          Expanded(
            child: DefaultInputForm(
                formTitle: 'Postcode',
                formContent: DefaultInput(
                    inputType: TextInputType.number,
                    inputController: tcFirstName,
                    inputHint: 'Example: 53000')),
          ),
        ],
      );
}
