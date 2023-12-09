import 'package:clean_arch_bookly_app/core/translation_helper/app_localizations.dart';
import 'package:clean_arch_bookly_app/features/search/presentation/manager/search_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/config/styles.dart';
import 'custom_search_text_field.dart';
import 'search_result_list_view_bloc_builder.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(
            onTextChanged: (text) {
              setState(() {
                searchText = text;
              });
            },
            onSearchPressed: () async {
              await BlocProvider.of<SearchCubit>(context)
                  .search(searchText.trim().toString());
            },
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "searchResult".tr(context),
            style: Styles.textStyle18,
          ),
          const Expanded(
            child: SearchResultListViewBlocBuilder(),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}


