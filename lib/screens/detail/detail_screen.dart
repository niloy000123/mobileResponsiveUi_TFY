import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobileui_the_fl_way/constants.dart';
import 'package:mobileui_the_fl_way/models/product.dart';
import 'package:mobileui_the_fl_way/screens/detail/component/body.dart';

import 'package:mobileui_the_fl_way/size_config.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, @required this.product}) : super(key: key);

  final Product? product;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: buildAppBar(context),
      body: Body(
        product: product,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset("assets/icons/arrow-long-left.svg")),
      actions: [
        IconButton(
            onPressed: () {}, icon: SvgPicture.asset("assets/icons/bag.svg")),
        SizedBox(
          width: SizeConfig.defaultSize,
        )
      ],
    );
  }
}
