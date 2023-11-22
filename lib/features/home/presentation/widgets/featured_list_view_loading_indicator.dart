import 'package:clean_arch_bookly_app/core/widgets/custom_fading_widget.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/config/size_configuration.dart';
import 'custom_book_image_loading_indicator.dart';

class FeaturedListViewLoadingIndicator extends StatelessWidget {
  const FeaturedListViewLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return CustomFadingWidget(
      child: SizedBox(
        height: SizeConfig.screenHeight! * .3,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => const Padding(
              padding: EdgeInsets.only(left: 20, top: 10),
              child: CustomBookImageLoading()),
        ),
      ),
    );
  }
}
