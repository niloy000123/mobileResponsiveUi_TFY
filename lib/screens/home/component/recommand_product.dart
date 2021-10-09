import 'package:flutter/material.dart';
import 'package:mobileui_the_fl_way/models/product.dart';
import 'package:mobileui_the_fl_way/screens/detail/detail_screen.dart';
import 'package:mobileui_the_fl_way/screens/home/component/product_card.dart';

import '../../../size_config.dart';

class RecommandProducts extends StatelessWidget {
  const RecommandProducts({
    Key? key,
    this.product,
  }) : super(key: key);

  final List<Product>? product;

  @override
  Widget build(BuildContext context) {
    MediaQueryData? _mediaQueryData = MediaQuery.of(context);
    double? defaultSize = SizeConfig.defaultSize;
    return Padding(
      padding: EdgeInsets.all(defaultSize! * 2),
      child: GridView.builder(
        itemCount: product!.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                _mediaQueryData.orientation == Orientation.landscape ? 4 : 2,
            childAspectRatio: 0.693,
            mainAxisSpacing: defaultSize * 2,
            crossAxisSpacing: defaultSize * 2),
        itemBuilder: (context, index) => ProductCard(
          product: product![index],
          press: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailScreen(product: product![index])));
          },
        ),
      ),
    );
  }
}
