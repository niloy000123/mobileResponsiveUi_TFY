import 'package:flutter/material.dart';
import 'package:mobileui_the_fl_way/size_config.dart';

class TitelText extends StatelessWidget {
  const TitelText({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String? title;

  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    return Text(
      title!,
      style:
          TextStyle(fontSize: defaultSize! * 1.6, fontWeight: FontWeight.bold),
    );
  }
}
