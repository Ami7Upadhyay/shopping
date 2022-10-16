import 'package:flutter/material.dart';

class CustomRoute<T> extends MaterialPageRoute<T> {
  CustomRoute({required WidgetBuilder builder, RouteSettings? settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    final tween =
        Tween<double>(begin: 0, end: MediaQuery.of(context).size.height);
    final scale = animation.drive(tween);

    return ScaleTransition(scale: scale, child: child);
  }
}
