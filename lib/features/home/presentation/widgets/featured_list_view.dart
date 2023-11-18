import 'package:flutter/material.dart';

import '../../../../config/size_configuration.dart';
import 'custom_book_image.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      height: SizeConfig.screenHeight! * .3,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => const Padding(
              padding: EdgeInsets.only(left: 20, top: 10),
              child: CustomBookImage())),
    );
  }
}
