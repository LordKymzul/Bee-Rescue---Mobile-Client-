import 'package:beerescue_mobile/features/view/components/form/default-input-form.dart';
import 'package:beerescue_mobile/features/view/components/input/password-input.dart';
import 'package:beerescue_mobile/features/view/components/input/prefix-icon-input.dart';
import 'package:beerescue_mobile/features/view/screen/credential/signup/signup-screen.dart';
import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:beerescue_mobile/shared/constant/assets-constant.dart';
import 'package:beerescue_mobile/shared/style/myappbar-style.dart';
import 'package:beerescue_mobile/shared/style/mypadding-style.dart';
import 'package:beerescue_mobile/shared/style/mytext-style.dart';
import 'package:beerescue_mobile/shared/utils/mysizebox.dart';
import 'package:flutter/material.dart';

import '../../../../shared/constant/size-constant.dart';
import '../../components/button/default-button.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController psController = TextEditingController();
  bool isVisible = true;

  void setIsVisible() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    psController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: MyAppBarStyle.plainAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHeader(context),
                MySizebox.getVerticalSizedBox(40),
                buildCredentialForm(context),
              ],
            ),
          ),
          buildBottom(context)
        ],
      ),
    );
  }

  Widget buildHeader(BuildContext context) => Padding(
        padding: MyPaddingStyle.getDefaultPadding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AssetsConstant.logo,
              height: 100,
              width: 100,
            ),
            MySizebox.getVerticalSizedBox(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: MyTextStyle.getTitleStyle(context,
                      SizeConstant.fontSizeLg, context.onBackgroundColor),
                ),
                MySizebox.getVerticalSizedBox(5),
                Text(
                  'Its great to have you back, please sign in',
                  style: MyTextStyle.getSubTitleStyle(context,
                      SizeConstant.fontSizeSm, context.onBackgroundColor),
                )
              ],
            )
          ],
        ),
      );

  Widget buildCredentialForm(BuildContext context) => Padding(
        padding: MyPaddingStyle.getDefaultPadding(),
        child: Column(
          children: [
            DefaultInputForm(
                formTitle: 'Email Address',
                formContent: PrefixIconInput(
                    inputController: emailController,
                    inputIcon: Icons.email_outlined,
                    inputHint: 'Email')),
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
            MySizebox.getVerticalSizedBox(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Forgot Password?',
                  style: MyTextStyle.getTitleStyle(
                      context, SizeConstant.fontSizeMd, context.primaryColor),
                )
              ],
            )
          ],
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
        buttonTitle: 'Login',
        buttonOnPressed: () {},
        isPrimary: true,
      );

  Widget buildFooter(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Don\'t have an account?',
            style: MyTextStyle.getSubTitleStyle(
                context, SizeConstant.fontSizeSm, context.onBackgroundColor),
          ),
          MySizebox.getHorizontalSizedBox(5),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SignUpScreen(),
              ));
            },
            child: Text(
              'Sign Up Here',
              style: MyTextStyle.getTitleStyle(
                  context, SizeConstant.fontSizeSm, context.primaryColor),
            ),
          ),
        ],
      );
}
