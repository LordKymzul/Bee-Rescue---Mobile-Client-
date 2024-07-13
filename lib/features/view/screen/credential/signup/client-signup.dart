import 'package:beerescue_mobile/features/view/components/form/default-input-form.dart';
import 'package:beerescue_mobile/features/view/components/input/default-input.dart';
import 'package:beerescue_mobile/features/view/components/input/prefix-icon-input.dart';
import 'package:beerescue_mobile/features/view/screen/onboard/register/reg-onboard-screen.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/style/mypadding-style.dart';
import 'package:beerescue_mobile/shared/utils/mysizebox.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/constant/size-constant.dart';
import '../../../../../shared/style/mytext-style.dart';
import '../../../components/button/default-button.dart';
import '../../../components/input/password-input.dart';

class ClientSignUp extends StatefulWidget {
  ClientSignUp({super.key});

  @override
  State<ClientSignUp> createState() => _ClientSignUpState();
}

class _ClientSignUpState extends State<ClientSignUp> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController psController = TextEditingController();
  bool isVisible = true;

  void setIsVisible() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      body: Column(
        children: [buildCredentialForm(), buildBottom(context)],
      ),
    );
  }

  Widget buildCredentialForm() => Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: Column(
            children: [
              DefaultInputForm(
                  formTitle: 'Full Name',
                  formContent: PrefixIconInput(
                    inputController: nameController,
                    inputHint: 'Full Name',
                    inputIcon: Icons.person_outline,
                  )),
              MySizebox.getVerticalSizedBox(20),
              DefaultInputForm(
                  formTitle: 'Email Address',
                  formContent: PrefixIconInput(
                    inputController: nameController,
                    inputHint: 'Email',
                    inputIcon: Icons.email_outlined,
                  )),
              MySizebox.getVerticalSizedBox(20),
              DefaultInputForm(
                  formTitle: 'Password',
                  formContent: PasswordInput(
                      inputController: psController,
                      inputHint: 'Password',
                      inputIcon: Icons.password,
                      onPressed: () {
                        setIsVisible();
                      },
                      isVisible: isVisible)),
            ],
          ),
        ),
      );

  Widget buildBottom(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
        child: Column(
          children: [
            buildButton(),
            MySizebox.getVerticalSizedBox(10),
            buildFooter(context)
          ],
        ),
      );

  Widget buildButton() => DefaultButton(
        buttonTitle: 'Register',
        buttonOnPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RegOnboardScreen(),
          ));
        },
        isPrimary: true,
      );

  Widget buildFooter(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Already have an account?',
            style: MyTextStyle.getSubTitleStyle(
                context, SizeConstant.fontSizeSm, context.onBackgroundColor),
          ),
          MySizebox.getHorizontalSizedBox(5),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              'Sign In Here',
              style: MyTextStyle.getTitleStyle(
                  context, SizeConstant.fontSizeSm, context.primaryColor),
            ),
          ),
        ],
      );
}
