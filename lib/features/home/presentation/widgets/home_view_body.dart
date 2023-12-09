import 'package:clean_arch_bookly_app/core/translation_helper/app_localizations.dart';
import 'package:clean_arch_bookly_app/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/size_configuration.dart';
import '../../../../core/config/styles.dart';
import 'custom_app_bar.dart';
import 'featured_books/featured_list_view_bloc_consumer.dart';
import 'newest_books/newest_books_list_view_bloc_builder.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CustomAppBar(),
            ),
            // FeaturedListView(),
            const FeaturedListViewBlocConsumer(),
            const VerticalSpace(4.5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "newestBooks".tr(context),
                style: Styles.textStyle18,
              ),
            ),
            const VerticalSpace(2),
            // BestSellerListView()
          ],
        )),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: NewestBoosListViewBlocBuilder(),
          ),
        )
      ],
    );
  }
}
