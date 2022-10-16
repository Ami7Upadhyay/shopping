import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopping/core/app_color.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final Widget? prefixIcon;
  const CustomTextField({Key? key, this.hintText, this.prefixIcon})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField>
    with TickerProviderStateMixin {
  late AnimationController fieldErrorAnimationController;
  late Animation<Offset> errorShakeAnimation;

  @override
  void initState() {
    fieldErrorAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
    // var curved1 =
    //     CurvedAnimation(parent: animationController, curve: Curves.bounceInOut);
    errorShakeAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0.03, 0))
            .animate(fieldErrorAnimationController);
    super.initState();
  }

  @override
  void dispose() {
    fieldErrorAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: errorShakeAnimation,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: const TextStyle(
          color: color26252A,
          fontSize: 13,
          fontWeight: FontWeight.w400,
        ),
        validator: (value) {
          fieldErrorAnimationController
              .forward()
              .then((value) => fieldErrorAnimationController.reverse());
          if (value?.isEmpty ?? false) {
            return "field can't be empty";
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon,
        ),
      ),
    );
  }
}
