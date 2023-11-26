import 'package:flutter/material.dart';

import '../../../domain/entities/book_entity.dart';
import 'newest_books_list_view_item.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({Key? key, required this.books}) : super(key: key);
  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: books.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: NewestBooksListViewItem(book: books[index]),
          );
        });
  }
}
