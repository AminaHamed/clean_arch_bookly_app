import 'package:clean_arch_bookly_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/functions/show_snake_bar.dart';
import '../../domain/entities/book_entity.dart';
import 'featured_list_view_loading_indicator.dart';

class FeaturedListViewBlocConsumer extends StatefulWidget {
  const FeaturedListViewBlocConsumer({Key? key}) : super(key: key);

  @override
  State<FeaturedListViewBlocConsumer> createState() =>
      _FeaturedListViewBlocConsumerState();
}

class _FeaturedListViewBlocConsumerState
    extends State<FeaturedListViewBlocConsumer> {
  final List<BookEntity> allBooks = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          allBooks.addAll(state.books);
        }
        if (state is FeaturedBooksPaginationFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(showCustomSnakeBar(state.msg));
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationFailure) {
          return FeaturedListView(
            books: allBooks,
          );
        } else if (state is FeaturedBooksFailure) {
          return Text(state.msg);
        } else {
          return const FeaturedListViewLoadingIndicator();
        }
      },
    );
  }
}
