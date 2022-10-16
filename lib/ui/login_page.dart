import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopping/component/custom_aseet_image.dart';
import 'package:shopping/component/custom_text.dart';
import 'package:shopping/component/custom_text_field.dart';
import 'package:shopping/core/app_color.dart';

import '../component/custom_button.dart';
import "package:shopping/core/extension.dart";

enum Social { google, apple, facebook }

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  List<Social> socilaLogin = [Social.google, Social.apple, Social.facebook];
  final _key = GlobalKey<FormState>();
  late AnimationController animationController;
  late Animation<Offset> sildeArrowAnimation;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    var curved = CurvedAnimation(
        parent: animationController, curve: Curves.easeInOutCubic);
    sildeArrowAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(50, 0))
            .animate(curved);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _titile(),
          const SizedBox(height: 15),
          _subTitile(),
          _emailAndPasswordField(),
          _forgotPassword(),
          const SizedBox(height: 15),
          _signInBtn(),
          _continueWith(),
          _buildSocialLogin(),
          _createAnAccount()
        ],
      ),
    );
  }

  Widget _titile() {
    return const CustomText(
      text: "Hello Again!",
      textAlign: TextAlign.center,
      fontSize: 20,
      color: color26252A,
      fontWeight: FontWeight.bold,
    );
  }

  Widget _subTitile() {
    return const CustomText(
      text: "Welcome back you've been missed!",
      fontSize: 14,
      color: color898989,
      fontWeight: FontWeight.w500,
    );
  }

  Widget _forgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
          onPressed: () {},
          child: const CustomText(
            text: "Forgot Password?",
            fontSize: 12,
            color: color3D7172,
            fontWeight: FontWeight.w500,
          )),
    );
  }

  Widget _emailAndPasswordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Form(
        key: _key,
        child: Column(
          children: const [
            CustomTextField(
              hintText: 'Email Address',
              prefixIcon: Icon(Icons.email_outlined, size: 20),
            ),
            SizedBox(height: 20),
            CustomTextField(
              hintText: "Password",
              prefixIcon: Icon(Icons.lock_outline, size: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget _signInBtn() {
    return CustomButton(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomText(
              text: "Sign In",
              color: Colors.white,
              fontSize: 16,
            ),
            const SizedBox(width: 10),
            SlideTransition(
              position: sildeArrowAnimation,
              child: const Icon(
                Icons.arrow_forward_sharp,
                size: 20,
              ),
            )
          ],
        ),
        onPressed: () {
          if (_key.currentState?.validate() ?? false) {
            animationController.forward();
          }
        });
  }

  Widget _continueWith() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          const Flexible(child: Divider(color: colorEAEAEA)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextButton(
                onPressed: () {},
                child: const CustomText(
                  text: "Continue with",
                  fontSize: 12,
                  color: color7D7D7D,
                  fontWeight: FontWeight.w500,
                )),
          ),
          const Flexible(child: Divider(color: colorEAEAEA)),
        ],
      ),
    );
  }

  Widget _createAnAccount() {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
          onPressed: () {},
          child: CustomText(
            text: "Create an Account",
            fontSize: 14,
            textDecoration: TextDecoration.underline,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w500,
          )),
    );
  }

  Widget _buildSocialLogin() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 20,
        children: List.generate(socilaLogin.length, (index) {
          return InkWell(
            onTap: () {},
            child: _buildSocialContainer(social: socilaLogin[index]),
          );
        }),
      ),
    );
  }

  Widget _buildSocialContainer({required Social social}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: colorEAEAEA, borderRadius: BorderRadius.circular(2)),
      child: CustomAssetImage(
        height: 20,
        width: 20,
        imageName: social.name,
      ),
    );
  }
}
