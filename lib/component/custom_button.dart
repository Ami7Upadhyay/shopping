import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final Widget child;
  final EdgeInsets? padding;
  final double? height;
  final double? width;
  const CustomButton(
      {Key? key,
      required this.child,
      required this.onPressed,
      this.padding,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          onPressed: () {
            onPressed();
          },
          style: ElevatedButton.styleFrom(
              primary: ThemeData().primaryColor, padding: padding),
          child: child),
    );
  }
}
