import 'package:flutter/material.dart';
import 'package:mobileui_the_fl_way/models/categories.dart';

import 'category_card.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
          (index) => CategoriCard(
            category: categories[index],
          ),
        ),
      ),
    );
  }
}
