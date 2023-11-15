import 'package:clean_arch_bookly_app/config/size_configuration.dart';
import 'package:clean_arch_bookly_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.defaultSize! * 3.5,
          bottom: SizeConfig.defaultSize! * 1),
      child: Row(
        children: [
          Image.asset(
            AppAssets.logo,
            height: 18,
          ),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 22,
              ))
        ],
      ),
    );
  }
}
