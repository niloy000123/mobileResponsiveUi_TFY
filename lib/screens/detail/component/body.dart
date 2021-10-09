import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobileui_the_fl_way/constants.dart';
import 'package:mobileui_the_fl_way/models/product.dart';
import 'package:mobileui_the_fl_way/screens/detail/component/product_description.dart';
import 'package:mobileui_the_fl_way/screens/detail/component/product_info.dart';
import 'package:mobileui_the_fl_way/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key, @required this.product}) : super(key: key);

  final Product? product;
  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    MediaQueryData? _mediaQueryData = MediaQuery.of(context);
    TextStyle lightTextStyle = TextStyle(color: kTextColor.withOpacity(0.6));
    return SingleChildScrollView(
        child: SizedBox(
      width: double.infinity,
      height: SizeConfig.orientation == Orientation.landscape
          ? SizeConfig.screenWidth
          : SizeConfig.screenHeight! - AppBar().preferredSize.height,
      child: Stack(
        children: [
          ProductrInfo(product: product),
          Positioned(
            top: defaultSize! * 37.5,
            left: 0,
            right: 0,
            child: ProductDescription(
              product: product,
              press: () {},
            ),
          ),
          Positioned(
              top: defaultSize * 7.5,
              right: -defaultSize * 5.5,
              child: Hero(
                tag: product!.id.toString(),
                child: Image.network(
                  product!.image.toString(),
                  fit: BoxFit.cover,
                  height: defaultSize * 37.8,
                  width: defaultSize * 36.8,
                ),
              ))
        ],
      ),
    ));
  }
}
