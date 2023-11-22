import 'package:clean_arch_bookly_app/core/utils/app_strings.dart';
import 'package:clean_arch_bookly_app/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/size_configuration.dart';
import '../../../../core/config/styles.dart';
import 'best_seller_list_view.dart';
import 'custom_app_bar.dart';
import 'featured_list_view_bloc_consumer.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CustomAppBar(),
            ),
            // FeaturedListView(),
            FeaturedListViewBlocConsumer(),
            VerticalSpace(4.5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                AppStrings.bestSeller,
                style: Styles.textStyle18,
              ),
            ),
            VerticalSpace(2),
            // BestSellerListView()
          ],
        )),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: BestSellerListView(),
          ),
        )
      ],
    );
  }
}
