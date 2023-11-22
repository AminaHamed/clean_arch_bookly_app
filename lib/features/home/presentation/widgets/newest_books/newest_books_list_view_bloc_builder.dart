import 'package:clean_arch_bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'newest_books_list_view.dart';
import 'newest_list_view_loading_indicator.dart';

class NewestBoosListViewBlocBuilder extends StatelessWidget {
  const NewestBoosListViewBlocBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return NewestBooksListView(books: state.books);
        }
        if (state is NewestBooksFailure) {
          return Text(state.msg);
        }
        return const NewestListViewLoadingIndicator();
      },
    );
  }
}
