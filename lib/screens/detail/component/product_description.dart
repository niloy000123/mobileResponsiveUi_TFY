import 'package:flutter/material.dart';
import 'package:mobileui_the_fl_way/models/product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({Key? key, this.product, this.press})
      : super(key: key);
  final Product? product;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    return Container(
      constraints: BoxConstraints(minHeight: defaultSize! * 44),
      padding: EdgeInsets.only(
          left: defaultSize * 2, right: defaultSize * 2, top: defaultSize * 9),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(defaultSize * 1.2),
              topRight: Radius.circular(defaultSize * 1.2))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product!.subTitle.toString(),
            style: TextStyle(
                fontSize: defaultSize * 1.8, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: defaultSize * 3,
          ),
          Text(
            product!.description.toString(),
            style: TextStyle(color: kTextColor.withOpacity(.7), height: 1.5),
          ),
          SizedBox(
            height: defaultSize * 3,
          ),
          SizedBox(
            width: double.infinity,
            child: FlatButton(
                padding: EdgeInsets.all(defaultSize * 1.5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                onPressed: press,
                color: kPrimaryColor,
                child: Text(
                  "Add to Cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: defaultSize * 1.6,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
