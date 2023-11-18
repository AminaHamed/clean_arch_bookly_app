import 'package:clean_arch_bookly_app/core/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (_, index) => const Padding(
          padding: EdgeInsets.only(bottom: 10),
              child: BookListViewItem(),
            ));
  }
}
