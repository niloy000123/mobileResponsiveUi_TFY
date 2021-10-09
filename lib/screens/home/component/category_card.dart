import 'package:flutter/material.dart';
import 'package:mobileui_the_fl_way/component/title_text.dart';
import 'package:mobileui_the_fl_way/constants.dart';
import 'package:mobileui_the_fl_way/models/categories.dart';
import 'package:mobileui_the_fl_way/size_config.dart';

class CategoriCard extends StatelessWidget {
  const CategoriCard({
    Key? key,
    @required this.category,
  }) : super(key: key);
  final Category? category;

  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    return Padding(
      padding: EdgeInsets.all(defaultSize! * 2),
      child: SizedBox(
        width: defaultSize * 20.5,
        child: AspectRatio(
            aspectRatio: 0.83,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ClipPath(
                  clipper: CategoryCustomShape(),
                  child: AspectRatio(
                    aspectRatio: 1.025,
                    child: Container(
                      padding: EdgeInsets.all(defaultSize * 2),
                      color: kSecondaryColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TitelText(title: category!.title),
                          SizedBox(
                            height: defaultSize,
                          ),
                          Text(
                            "${category!.numOfProducts} prpduct",
                            style:
                                TextStyle(color: kTextColor.withOpacity(0.6)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: AspectRatio(
                      aspectRatio: 1.15,
                      child: FadeInImage.assetNetwork(
                          placeholder: "assets/spinner.gif",
                          image: "${category!.image}"),
                    ))
              ],
            )),
      ),
    );
  }
}

class CategoryCustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double height = size.height;
    double width = size.width;
    double cornerSize = 30;

    path.lineTo(0, height - cornerSize);
    path.quadraticBezierTo(0, height, cornerSize, height);
    path.lineTo(width - cornerSize, height);
    path.quadraticBezierTo(width, height, width, height - cornerSize);
    path.lineTo(width, cornerSize);
    path.quadraticBezierTo(width, 0, width - cornerSize, 0);
    path.lineTo(cornerSize, cornerSize * 0.75);
    path.quadraticBezierTo(0, cornerSize, 0, cornerSize * 2);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
