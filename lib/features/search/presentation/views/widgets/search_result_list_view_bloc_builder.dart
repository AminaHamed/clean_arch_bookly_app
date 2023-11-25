import 'package:clean_arch_bookly_app/features/search/presentation/manager/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/presentation/widgets/newest_books/newest_list_view_loading_indicator.dart';
import 'search_result_list_view.dart';

class SearchResultListViewBlocBuilder extends StatelessWidget {
  const SearchResultListViewBlocBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchFailure) {
          return Text(state.msg);
        }
        if (state is SearchSuccess) {
          return SearchResultListView(books: state.books);
        }
        if (state is SearchLoading) {
          return const NewestListViewLoadingIndicator();
        } else {
          return Container();
        }
      },
    );
  }
}
