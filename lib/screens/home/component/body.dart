import 'package:flutter/material.dart';
import 'package:mobileui_the_fl_way/component/title_text.dart';
import 'package:mobileui_the_fl_way/screens/home/component/recommand_product.dart';
import 'package:mobileui_the_fl_way/services/fetch_categories.dart';
import 'package:mobileui_the_fl_way/services/fetch_products.dart';
import 'package:mobileui_the_fl_way/size_config.dart';

import 'categories.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
        child: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(defaultSize! * 2),
            child: const TitelText(
              title: "Browse by Categories",
            ),
          ),
          FutureBuilder(
            future: fetchCategories(),
            builder: (context, AsyncSnapshot snapshot) => snapshot.hasData
                ? Categories(categories: snapshot.data)
                : Center(child: Image.asset("assets/ripple.gif")),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultSize * 2),
            child: const Divider(
              height: 5,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(defaultSize * 2),
            child: const TitelText(
              title: "Recommands For You",
            ),
          ),
          FutureBuilder(
            future: fetchProducts(),
            builder: (context, AsyncSnapshot snapshot) {
              return snapshot.hasData
                  ? RecommandProducts(
                      product: snapshot.data,
                    )
                  : Center(child: Image.asset("assets/ripple.gif"));
            },
          )
        ],
      ),
    ));
  }
}
