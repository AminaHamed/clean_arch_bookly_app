import 'package:clean_arch_bookly_app/core/utils/constants.dart';
import 'package:clean_arch_bookly_app/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../core/config/size_configuration.dart';
import 'book_details_section.dart';
import 'custom_book_details_app_bar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Column(
              children: [
                CustomBookDetailsAppBar(),
                BookDetailsSection(),
                VerticalSpace(4),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Center(child: Text(sharedBook?.description ?? '')),
          ),
        ],
      ),
    );
  }
}
