import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopping/component/custom_aseet_image.dart';
import 'package:shopping/component/custom_button.dart';
import 'package:shopping/component/custom_text.dart';
import 'package:shopping/core/app_color.dart';
import 'package:shopping/ui/login_page.dart';

class ExporePage extends StatelessWidget {
  const ExporePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildContent(context));
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _image(context),
          const SizedBox(height: 30),
          _findYourNextText(),
          const SizedBox(height: 30),
          _description(),
          const SizedBox(height: 30),
          _exploreBtn(context)
        ],
      ),
    );
  }

  Widget _image(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: double.infinity,
      decoration: BoxDecoration(
          color: colorDAFAF9, borderRadius: BorderRadius.circular(4)),
      child: const CustomAssetImage(
        imageName: "find_explore",
      ),
    );
  }

  Widget _findYourNextText() {
    return const CustomText(
      text: '''
Find your next
Clothes here''',
      color: color26252A,
      fontSize: 25,
      textAlign: TextAlign.center,
      fontWeight: FontWeight.w600,
    );
  }

  Widget _description() {
    return const CustomText(
      text:
          "Explore all the most trending clothes here based on your interest and go shopping!",
      color: color898989,
      fontSize: 15,
      textAlign: TextAlign.center,
      fontWeight: FontWeight.w500,
    );
  }

  Widget _exploreBtn(BuildContext context) {
    return CustomButton(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: const CustomText(
          text: "Need to explore!",
          color: Colors.white,
          fontSize: 12,
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginPage()));
        });
  }
}
