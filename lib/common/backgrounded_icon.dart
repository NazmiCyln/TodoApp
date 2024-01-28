import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../gen/assets.gen.dart';

class BackgroundedIcon extends StatelessWidget {
  final Color backgroundColor;
  final SvgGenImage icon;
  const BackgroundedIcon({super.key, required this.backgroundColor, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Assets.images.iconBg.image(color: backgroundColor),
        icon.svg(
          height: 32.r,
          width: 32.r,
        ),
      ],
    );
  }
}
