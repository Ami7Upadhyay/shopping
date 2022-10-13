import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopping/core/extension.dart';

class CustomAssetImage extends StatelessWidget {
  final String imageName;
  final BoxFit boxFit;
  final double? height;
  final double? width;
  const CustomAssetImage(
      {Key? key,
      required this.imageName,
      this.boxFit = BoxFit.cover,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(imageName.toPng),
      fit: boxFit,
      width: width,
      height: height,
    );
  }
}
