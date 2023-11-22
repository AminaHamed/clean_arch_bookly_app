import 'package:clean_arch_bookly_app/core/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';

import 'newest_books_list_view_item_indicator.dart';

class NewestListViewLoadingIndicator extends StatelessWidget {
  const NewestListViewLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 10,
          itemBuilder: (_, index) => const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: NewestBooksListViewItemIndicator())),
    );
  }
}
