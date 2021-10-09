import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobileui_the_fl_way/constants.dart';
import 'package:mobileui_the_fl_way/screens/home/component/body.dart';
import 'package:mobileui_the_fl_way/size_config.dart';
// import 'package:flutter_svg/svg.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: bildAppBar(),
      body: const Body(),
    );
  }

  AppBar bildAppBar() {
    return AppBar(
      leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/menu.svg",
            height: SizeConfig.defaultSize! * 2,
          )),
      actions: [
        IconButton(
            onPressed: () {}, icon: SvgPicture.asset("assets/icons/scan.svg")),
        const Center(
          child: Text(
            "Scan",
            style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: SizeConfig.defaultSize,
        )
      ],
    );
  }
}
